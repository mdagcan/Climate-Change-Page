# Simple R script to create a Plotly visualization
library(plotly)
library(htmlwidgets)

# Create data
data <- data.frame(
  Year = 2000:2023,
  Temperature = 0.5 + 0.03*(0:23) + sin(0:23/5)*0.2 + rnorm(24, 0, 0.1)
)

# Create Plotly chart
p <- plot_ly(data, x = ~Year, y = ~Temperature, 
        type = 'scatter', mode = 'lines+markers',
        line = list(color = 'red', width = 3),
        marker = list(size = 8),
        hovertemplate = 'Year: %{x}<br>Temperature: %{y:.2f}°C') %>%
  layout(
    title = paste('Climate Change Visualization - Created', Sys.Date()),
    xaxis = list(title = 'Year'),
    yaxis = list(title = 'Temperature Anomaly (°C)'),
    plot_bgcolor = '#f5f5f5'
  )

# Display the plot
print(p)

# Save as HTML file
htmlwidgets::saveWidget(p, "climate_plot.html", selfcontained = TRUE)

cat("File saved as 'climate_plot.html' - Open it in a web browser!\n")
cat("Upload this file to GitHub Pages, RPubs, or NeoCities.\n")
