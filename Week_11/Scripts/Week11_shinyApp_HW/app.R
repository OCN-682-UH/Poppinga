### shinyApp Homework
### Created by: Haley Poppinga
### Created on: 2025_11_09
###########################################

# Load Libraries
library(shiny)
library(tidyverse)
library(here)
library(ghibli)
library(stringr)
library(lubridate)
library(forcats)

# Read Data
MMdata<-read_csv(here("Week_11","Data","MMdata_2025.csv"))
glimpse(MMdata)

# Clean the Data
MMdata_clean<-MMdata %>% 
  mutate(across(where(is.character), str_trim), # trim white spaces in all of data
         lat = as.numeric(lat), # coordinates as numbers
         long = as.numeric(long), 
         assess_date = ymd(assess_date), # fix the dates using lubridate
         removal = str_to_lower(removal),
         removal = recode(removal, "a" = "Assessment", # rename removal categories
                          "e" = "Estimate",
                          "h" = "Huki",
                          "ae" = "Area-Estimate",
                          "c" = "Cleared",
                          "n" = "No Information",
                          .default = NA_character_), # drop unmapped entries
         removal = fct_relevel(removal, "Huki", "Assessment", "Estimate", # reorder factor levels using Forcats 
                               "Area-Estimate", "Cleared", "No Information", "Unknown")) %>%
  drop_na(removal) %>% 
  droplevels() %>% # drop extra levels 
  distinct() # remove empty or duplicates

# transform data
# Renames for algae columns
algae_columns <- c(a = "Avrainvillea lacerata", as = "Acanthophera spicifera", gs = "Gracilaria salicornia",
                   o = "Other", bp = "Bryopsis pinata", cr = "Caulerpa racemosa", caul = "Caulerpa sertulariodes", 
                   ce = "Codium edule", chon = "Chondria sp.", clad = "Cladophora sp.", cm = "Cladophoropsis sp.",
                   dc   = "Dictyosphaeria cavernosa", da = "Dictyota acutiloba", df = "Dictyota friabilis",
                   ds   = "Dictyota sandvichensis", dict = "Dictyota Unknown", gc = "Gracilaria coronopifolia",
                   gp   = "Gracilaria parvispora", gr = "Galaxaura rugosa", hal = "Halimeda discoidea",
                   hh   = "Halophila hawaiiana", hyd = "Hydroclathrus clathratus", hyp  = "Hypnea sp.",
                   lc   = "Leptolyngbya crosbyana", lyng = "Lyngbya majuscula", lau = "Laurencia nidifica",
                   neo  = "Neoneris sp.",pad  = "Padina sp.", spy  = "Spyridia filamentosa", uf   = "Ulva flexuosa")
# identify taxa columns automatically and keep numeric columns that are not metadata, columns we DON'T want treated as taxa
meta_columns<-c("lat", "long", "plot_id", "month", "year", "great_huki_year", 
                "assess_date", "removal", "non-removal", "sand_depth_mean", "rock", "sand")
# only keep algae columns that actually exist
taxa_columns <- setdiff(names(MMdata_clean), meta_columns)
taxa_columns <- intersect(taxa_columns, names(algae_columns))  



MMdata_long<-MMdata_clean %>% # pivot the data longer
  pivot_longer(cols = all_of(taxa_columns),
               names_to = "taxon_code",
               values_to = "cover") %>% 
  drop_na(removal) %>% 
  mutate(taxon =recode(taxon_code, !!!algae_columns), # fix full scientific names
         cover = ifelse(cover < 0 | cover > 100, NA_real_, cover)) # fix impossible cover values
                      
         
# Notes:
# everything in server can be written just like R 
# everything in ui fluid page needs to have commas between functions

ui<-fluidPage(
  # input functions
  titlePanel("Mālama Maunalua 2025 Macroalgal Cover in Maunalua Bay"), 
  sidebarLayout(sidebarPanel(selectInput("taxon",
                                         label = "Choose an Algae Taxon",
                                         choices = sort(unique(na.omit(MMdata_long$taxon))),
                                         selected = sort(unique(na.omit(MMdata_long$taxon)))[1]),
                             width = 3),
                mainPanel(tabsetPanel(tabPanel("Plot",
                                               plotOutput("cover_plot")), # output functions
                                      tabPanel("Summary Table",
                                               tableOutput("summary_table"))))))
# common between ui functions will create something for slider use


server<-function(input, output){
  
  filtered_data<-reactive({ # reactive subset of data based on inputs
    MMdata_long %>% 
      filter(taxon == input$taxon)})
  # {} allows us to put all our R code in one nice chunk
# Plot Output  
  output$cover_plot<-renderPlot({
    req(nrow(filtered_data()) > 0)
    ggplot(filtered_data(), aes(x = removal, y = cover)) + # new ggplot with reactive data
      geom_boxplot(outlier.alpha = 0.25, alpha = 0.8, na.rm = TRUE) + # boxplot
      coord_cartesian(ylim = c(0, 50)) + # percent cover limits up to 60% 
      labs(title = paste("Percent Cover of", input$taxon, "(2025)"), # add a new title based on what user choose
           x = "Assessment Type",
           y = "Percent Cover") +
 #     scale_fill_ghibli_d("MarnieMedium2") + # nice colors from the ghibli package
      theme_minimal(base_size = 14) + 
      theme(panel.grid.minor = element_blank(),
            axis.text.x = element_text(angle = 25, hjust = 1),
            plot.title = element_text(hjust = 0.5, face = "bold", size = 15))})
# Summary Table
  output$summary_table<- renderTable({ # calculate summary table 
    # make sure we actually have rows
    req(nrow(filtered_data()) > 0)
#    validate(need(nrow(filtered_data()) > 0, "No data for this taxon."))
    filtered_data() %>% 
      group_by(removal) %>% 
      summarise(n = sum(!is.na(cover)),
                mean_cover = mean(cover, na.rm = TRUE),
                sd_cover = sd(cover, na.rm = TRUE),
                .groups = "drop") %>%
      mutate(across(c(mean_cover, sd_cover), ~ round(.x, 2)), # keep 2 decimal places
             removal = as.character(removal)) %>%  # ensure simple atomic cols)
      arrange(removal) %>% 
      rename(`Assessment Type` = removal,
             `Sample Size (n)`  = n,
             `Mean Cover (%)`   = mean_cover,
             `SD Cover (%)`     = sd_cover) %>% 
      as.data.frame()},
    rownames = FALSE, na = "", striped = TRUE, bordered = TRUE)
}

# Run the Shiny App
shinyApp(ui = ui, server = server)

