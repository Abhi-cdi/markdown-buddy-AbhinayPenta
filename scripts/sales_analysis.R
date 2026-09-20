library(dplyr)
library(ggplot2)

if (!file.exists("data/synthetic_sales.csv")) {
  stop("Missing file reference setup parameters.")
}
sales_data <- read.csv("data/synthetic_sales.csv")

regional_summary <- sales_data %>%
  group_by(Region) %>%
  summarize(Total_Revenue = sum(Revenue, na.rm = TRUE))

print(regional_summary)

ggplot(sales_data, aes(x = Region, y = Revenue, fill = Region)) +
  geom_bar(stat = "identity", width = 0.6) +
  theme_minimal() +
  labs(title = "Total Revenue Distribution", x = "Region", y = "Revenue ($)")

ggsave("analysis/revenue_by_region.png", width = 7, height = 5)
