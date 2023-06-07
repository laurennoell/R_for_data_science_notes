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
