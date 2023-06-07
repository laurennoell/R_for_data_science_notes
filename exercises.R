# Chapter 5 
    # Section 5.6 
        # Question 1a)
        flights |> 
            filter(dest == "IAH") |> 
            group_by(year, month, day) |> 
            summarize(
                n = n(),
                delay = mean(arr_delay, na.rm = TRUE)
            ) |>
            filter(n > 10)
        flights
        # Question 1b)
        flights |>
            filter(carrier == "UA",
                   dest%in%c("IAH","HOU"),
                   sched_dep_time > 0900,
                   sched_arr_time<2000
                ) |>
            group_by(flight) |>
            summarize(
                delay = mean(arr_delay, na.rm=TRUE),
                cancelled = sum(is.na(arr_delay)),
                n=n()
                ) |>
            filter(n>10)
# Chapter 6
    # Section 6.2
        # Question 2
        table2 |>
            pivot_wider(names_from=type,values_from=count) |>
            mutate(rate=cases/population * 10000)
# Chapter 8
    # Section 2
        # Question 1
            read_delim("filename.txt", sep = "|")
        # Question 2
            # quote, col_names, col_types, col_select, id, locale, n
            # a, quoted_na, trim_ws, skip, n_max, guess_max, name_repair, 
            # num_threads, progress, show_col_types, skip_empty_rows, lazy 
        # Question 3
            # The filename and the function used to determine the length of every field.
            # There are four such functions: fwf_empty(), fwf_widths(), fwf_positions(), fwf_cols()
        # Question 4
            read_csv("filename.csv", quote = "'")
        # Question 5
            # a) Mismatched number of columns. Given two categories "a" and "b" but 3 columns worth of values. 
            # b) Same problem as a)
            # c) Quote is unclosed. 
            # d) Data mismatch. Row 1 is numbers, row 2 is characters. 
            # e) Need to specify the delimiter is ";". It causes there to be one column with one data value
        # Question 6
            # a)
            annoying |> select(`1`) 
            # b) 
            ggplot(annoying, aes(x=`1`, y=`2`)) + geom_point()
            # c) 
            annoying |> mutate(`3` = `2`/`1`)
            # d) 
            annoying |> mutate(`3` = `2`/`1`) |> rename("one" = `1`, "two" = `2`, "three" = `3`)
# Chapter 10
    # Section 2
        # Question 1
            # 2 corresponds to triangle shape.
            ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(color = "pink", shape = 2)
        # Question 2
            # aes is used to map a variable to a specific aesthetic, it is not used to map every
            # variable to a color, shape, etc. The following line of code will work:
            ggplot(mpg) + geom_point(aes(x = hwy, y = displ), color = "blue")
        # Question 3
            # The `stroke` aesthetic is used to control the size of the border around the shapes.
        # Question 4
            # It will take each point and check its associated displ value, if it is less than 5,
            # aes will assign a different color to the displ values at 5 or above.
    # Section 3
        # Question 1
            # line chart: geom_line(), boxplot: geom_boxplot(), histogram: geom_histogram(),
            # area chart: geom_area()
        # Question 2
            # FALSE value removes the legend from being generated on the right hand side of the graph.
            # It was used to save space and the fact that the same legend (colours were kept equal) was
            # used in a previous graph making it unnecesary. 
        # Question 3
            # The `se` argument handles the confidence interval around a line. 
        # Question 4
            # a)
            ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(size = 3) + geom_smooth(se = 0)
            # b)
            ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(size = 3) +
                geom_smooth(group = drv, se = 0)
            # c)
            ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(size = 3, aes(color = drv)) +
                geom_smooth(aes(color = drv), se = 0)
            # d)
            ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(size = 3, aes(color = drv)) +
                geom_smooth(se = 0)
            # e)
            ggplot(mpg, aes(x = displ, y = hwy)) + geom_point(size = 3, aes(color = drv)) +
                geom_smooth(aes(linetype = drv), se = 0)
            # f)
            # pch sets what kind of point to be used. it can be filled and outlined separately. 
            ggplot(mpg, aes(x = displ, y = hwy)) + 
                geom_point(
                    aes(fill = drv),
                    pch = 21,
                    color = "white",
                    size = 4,
                    stroke = 2
                )
        # Section 4
            # Question 1
                # ggplot will make a new grid for every unique value in the continuous variable. 
            # Question 2
                # The empty graphs indicate where the combination of drive and cylinder do not exist. For
                # example, there are no 5 cylinder all wheel drive vehicles so the plot is empty. The given
                # piece of R-code makes this easier to see since the intersection x=4 and y=5 is empty. 
            # Question 3
                # Essentially we are using facet_grid with only variable (similar to facet_wrap). "drv ~ ."
                # makes it drv is the x-variable plotted against nothing. ". ~ cyl" will plot cyl as a y-variable
                # plotted against nothing (similar to facet_wrap)
            # Question 4
                # Even with the different colourings on class, it is still hard to ascertain general patterns
                # about the behaviours of each singular type of class. A facet wrap helps solve this problem.
            # Question 5
                # nrow: Sets the number of rows to be displayed. #ncol - Similar.
                # dir: displays horizontally or vertically
                # drop: does not display empty tables. 
                # as.table: ordered like a table iwth highest values at bottom-right.
                # scales: whether to have x and y variable be kept the same across all tables or individually fit to each.
            # Question 6
                # It is easier to compare when all the graphs are stacked on top of each other.
                # As long as it makes sense to keep x-variable be the same length across all graphs, it should be stacked
                # vertically rather than horizontally 
            # Question 7
                ggplot(mpg) + 
                    geom_point(aes(x = displ, y = hwy)) + 
                    facet_wrap(~drv, dir = "h")
                # The labels are now on top rather than on the side.
        # Section 5
            # Question 1
                # The default geom associated with stat_summary() is pointrange.
                ggplot(diamonds) + 
                    stat_summary(
                        aes(x = cut, y = depth),
                        fun.min = min,
                        fun.max = max,
                        fun = median,
                        geom = pointrange
                    )
            # Question 2
                # geom_bar() makes the height of the bar proportional to the number of cases in each group, geom_col()
                # makes the height of the bars represent the values in the data. 
            # Question 3
                # geom_point() - stat_identity(): No transformation of data, used to make simple scattlerplots.
                # geom_histogram() - stat_bin(): stat_bin() "bins" the data and geom_histogram visualizes it.
                # geom_bar() - stat_count(): stat_count() counts # of occurences and geom_bar visualizes it.
                # geom_boxplot() - stat_boxplot()
                # geom_density() - stat_density()
                # geom_smooth() - stat_smooth()
                # geom_line() - stat_summary()
                # in general, the stat function transforms the data in some manner and geom visualizes the transformed data.
            # Question 4
                # functionally the same as geom_smooth() but we can change the results with a non-standard geom.
            # Question 5
                # The "group = 1" argument is used to specify that the proportions are calculated over all bars together,
                # not separately for each bar.

