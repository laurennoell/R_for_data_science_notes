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

