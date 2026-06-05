############################################################
# 《R语言实战》第3版 第四章：图形初阶（ggplot2）代码练习题
# 基于 mosaicData::CPS85
############################################################

# ========================
# 0. 准备工作
# ========================
# install.packages(c("ggplot2", "mosaicData", "scales"))

library(ggplot2)
library(mosaicData)
library(scales)

data(CPS85, package = "mosaicData")

# 创建新的图片保存文件夹
output_dir <- file.path(getwd(), "ggplot2_chapter4_outputs")
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# sex 水平已确认是 F / M
sex_color_values <- c("F" = "indianred3", "M" = "cornflowerblue")
sex_shape_values <- c("F" = 16, "M" = 17)
sex_lty_values   <- c("F" = "solid", "M" = "dashed")


cat("\n================ 第 1 题 ================\n")
# 第 1 题
str(CPS85)
head(CPS85)
summary(CPS85[, c("wage", "exper", "sex", "sector")])


cat("\n================ 第 2 题 ================\n")
# 第 2 题
p <- ggplot(CPS85, aes(x = exper, y = wage))
print(p)  # 只创建对象，不加图层，通常不会显示散点


cat("\n================ 第 3 题 ================\n")
# 第 3 题
p_point <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point()
print(p_point)


cat("\n================ 第 4 题 ================\n")
# 第 4 题
p4 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(color = "blue")
print(p4)


cat("\n================ 第 5 题 ================\n")
# 第 5 题
p5 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point()
print(p5)


cat("\n================ 第 6 题 ================\n")
# 第 6 题
# 代码 A：颜色固定为蓝色，所有点颜色相同，不按 sex 分组，也不会出现 sex 图例
p6a <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(color = "blue")
print(p6a)

# 代码 B：颜色映射到 sex，不同性别显示不同颜色，并生成图例
p6b <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point()
print(p6b)


cat("\n================ 第 7 题 ================\n")
# 第 7 题
p7 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(alpha = 0.5, size = 2, shape = 16)
print(p7)


cat("\n================ 第 8 题 ================\n")
# 第 8 题
p8 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex, shape = sex)) +
  geom_point(alpha = 0.7)
print(p8)


cat("\n================ 第 9 题 ================\n")
# 第 9 题
p9 <- ggplot(CPS85, aes(x = exper, y = wage, color = sector)) +
  geom_point()
print(p9)

table(CPS85$sector)


cat("\n================ 第 10 题 ================\n")
# 第 10 题
p10 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex, size = age)) +
  geom_point(alpha = 0.5)
print(p10)


cat("\n================ 第 11 题 ================\n")
# 第 11 题
p11 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(alpha = 0.5) +
  geom_smooth()
print(p11)


cat("\n================ 第 12 题 ================\n")
# 第 12 题
p12 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm")
print(p12)


cat("\n================ 第 13 题 ================\n")
# 第 13 题
p13 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE)
print(p13)


cat("\n================ 第 14 题 ================\n")
# 第 14 题
p14 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE)
print(p14)


cat("\n================ 第 15 题 ================\n")
# 第 15 题
p15 <- ggplot(CPS85, aes(x = exper, y = wage,
                         color = sex, shape = sex, linetype = sex)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE)
print(p15)


cat("\n================ 第 16 题 ================\n")
# 第 16 题
p16 <- ggplot(CPS85, aes(x = exper, y = wage,
                         color = sex, shape = sex, linetype = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
print(p16)


cat("\n================ 第 17 题 ================\n")
# 第 17 题
p17 <- p16 +
  scale_color_manual(values = sex_color_values)
print(p17)


cat("\n================ 第 18 题 ================\n")
# 第 18 题
p18 <- p16 +
  scale_shape_manual(values = sex_shape_values)
print(p18)


cat("\n================ 第 19 题 ================\n")
# 第 19 题
p19 <- p16 +
  scale_linetype_manual(values = sex_lty_values)
print(p19)


cat("\n================ 第 20 题 ================\n")
# 第 20 题
p20 <- p16 +
  scale_color_manual(values = sex_color_values) +
  scale_shape_manual(values = sex_shape_values) +
  scale_linetype_manual(values = sex_lty_values)
print(p20)


cat("\n================ 第 21 题 ================\n")
# 第 21 题
p21 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  scale_x_continuous(breaks = seq(0, 60, 10))
print(p21)


cat("\n================ 第 22 题 ================\n")
# 第 22 题
p22 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  scale_y_continuous(breaks = seq(0, 30, 5))
print(p22)


cat("\n================ 第 23 题 ================\n")
# 第 23 题
p23 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5))
print(p23)


cat("\n================ 第 24 题 ================\n")
# 第 24 题
p24 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar)
print(p24)


cat("\n================ 第 25 题 ================\n")
# 第 25 题
p25 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point() +
  labs(
    title = "Relationship between wage and experience",
    subtitle = "Current Population Survey",
    x = "Years of Experience",
    y = "Hourly Wage",
    color = "Gender"
  )
print(p25)


cat("\n================ 第 26 题 ================\n")
# 第 26 题
p26 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point() +
  labs(
    title = "工作年限与工资的关系",
    x = "工作年限",
    y = "时薪",
    color = "性别"
  )
print(p26)


cat("\n================ 第 27 题 ================\n")
# 第 27 题
p27 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  facet_wrap(~ sector)
print(p27)


cat("\n================ 第 28 题 ================\n")
# 第 28 题
p28 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sector)
print(p28)


cat("\n================ 第 29 题 ================\n")
# 第 29 题
p29 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex, shape = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sector)
print(p29)


cat("\n================ 第 30 题 ================\n")
# 第 30 题
p30 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex, shape = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sector, ncol = 2)
print(p30)


cat("\n================ 第 31 题 ================\n")
# 第 31 题
p31 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex, shape = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sector, scales = "free_y")
print(p31)


cat("\n================ 第 32 题 ================\n")
# 第 32 题
# 代码 A：所有分面共享相同的 y 轴范围，便于分面间直接比较
p32a <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  facet_wrap(~ sector)
print(p32a)

# 代码 B：每个分面使用自己的 y 轴范围，更便于观察各行业内部变化，但不利于直接比较绝对高低
p32b <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  facet_wrap(~ sector, scales = "free_y")
print(p32b)


cat("\n================ 第 33 题 ================\n")
# 第 33 题
p33 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  theme_bw()
print(p33)


cat("\n================ 第 34 题 ================\n")
# 第 34 题
p34 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  theme_minimal()
print(p34)


cat("\n================ 第 35 题 ================\n")
# 第 35 题
p_classic <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  theme_classic()
print(p_classic)


cat("\n================ 第 36 题 ================\n")
# 第 36 题
p36 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  labs(title = "Wage and Experience") +
  theme(plot.title = element_text(hjust = 0.5))
print(p36)


cat("\n================ 第 37 题 ================\n")
# 第 37 题
p37 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point() +
  theme(legend.position = "bottom")
print(p37)


cat("\n================ 第 38 题 ================\n")
# 第 38 题
p38 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point() +
  theme(legend.position = "none")
print(p38)


cat("\n================ 第 39 题 ================\n")
# 第 39 题
p39 <- ggplot(CPS85, aes(x = exper, y = wage,
                         color = sex, shape = sex, linetype = sex)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) +
  labs(
    title = "Relationship between Wage and Experience",
    x = "Years of Experience",
    y = "Hourly Wage",
    color = "Gender",
    shape = "Gender",
    linetype = "Gender"
  ) +
  theme_bw() +
  theme(legend.position = "bottom")
print(p39)


cat("\n================ 第 40 题 ================\n")
# 第 40 题
ggsave(
  filename = file.path(output_dir, "wage_experience.png"),
  plot = p39,
  width = 8,
  height = 5,
  dpi = 300
)


cat("\n================ 第 41 题 ================\n")
# 第 41 题
ggsave(
  filename = file.path(output_dir, "wage_experience.pdf"),
  plot = p39,
  width = 8,
  height = 5
)


cat("\n================ 第 42 题 ================\n")
# 第 42 题
getwd()
cat("图片保存文件夹：", output_dir, "\n")
file.exists(file.path(output_dir, "wage_experience.png"))
file.exists(file.path(output_dir, "wage_experience.pdf"))


cat("\n================ 第 43 题 ================\n")
# 第 43 题
dir(output_dir)
list.files(output_dir)
"wage_experience.png" %in% list.files(output_dir)
"wage_experience.pdf" %in% list.files(output_dir)


cat("\n================ 第 44 题 ================\n")
# 第 44 题
p44 <- ggplot(data = CPS85,
              mapping = aes(x = exper, y = wage)) +
  geom_point(alpha = .7) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     labels = scales::dollar)
print(p44)


cat("\n================ 第 45 题 ================\n")
# 第 45 题
p45 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     labels = scales::dollar)
print(p45)


cat("\n================ 第 46 题 ================\n")
# 第 46 题
p46 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point(color = "red")
print(p46)


cat("\n================ 第 47 题 ================\n")
# 第 47 题
p47 <- ggplot(CPS85, aes(x = exper, y = wage, color = sex)) +
  geom_point()
print(p47)


cat("\n================ 第 48 题 ================\n")
# 第 48 题
p48 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  facet_wrap(~ sector)
print(p48)


cat("\n================ 第 49 题 ================\n")
# 第 49 题
p49 <- ggplot(CPS85, aes(x = exper, y = wage)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
print(p49)


cat("\n================ 第 50 题 ================\n")
# 第 50 题
p50 <- ggplot(data = CPS85,
              mapping = aes(x = exper, y = wage,
                            color = sex, shape = sex, linetype = sex)) +
  geom_point(alpha = .7) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5),
                     labels = scales::dollar) +
  scale_color_manual(values = sex_color_values) +
  facet_wrap(~ sector) +
  theme_bw()
print(p50)


cat("\n================ 第 51 题 ================\n")
# 第 51 题
p51 <- ggplot(CPS85, aes(x = exper, y = wage,
                         color = sex, shape = sex, linetype = sex)) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) +
  scale_color_manual(values = sex_color_values) +
  facet_wrap(~ sector) +
  theme_bw()
print(p51)

ggsave(
  filename = file.path(output_dir, "final_plot.png"),
  plot = p51,
  width = 8,
  height = 5,
  dpi = 300
)


cat("\n================ 第 52 题 ================\n")
# 第 52 题
cat("筛选前样本数：", nrow(CPS85), "\n")
CPS85_sub <- subset(CPS85, wage <= 30)
cat("筛选后样本数：", nrow(CPS85_sub), "\n")

p52 <- ggplot(CPS85_sub, aes(x = exper, y = wage)) +
  geom_point()
print(p52)


cat("\n================ 第 53 题 ================\n")
# 第 53 题
p53 <- ggplot(CPS85_sub, aes(x = exper, y = wage, color = sex, shape = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal()
print(p53)


cat("\n================ 第 54 题 ================\n")
# 第 54 题
p54 <- ggplot(CPS85_sub, aes(x = exper, y = wage, color = sex)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ sector, ncol = 2)
print(p54)

ggsave(
  filename = file.path(output_dir, "facet_wage_sector.png"),
  plot = p54,
  width = 8,
  height = 5,
  dpi = 300
)


cat("\n================ 第 55 题 ================\n")
# 第 55 题
# 自选数值型变量：educ
p55 <- ggplot(CPS85, aes(x = educ, y = wage)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Relationship between Education and Wage",
    x = "Years of Education",
    y = "Hourly Wage"
  )
print(p55)


cat("\n================ 作业完成 ================\n")
cat("所有保存的图片均位于文件夹：", output_dir, "\n")
print(list.files(output_dir))