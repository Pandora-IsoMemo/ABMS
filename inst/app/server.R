shinyServer(function(input, output, session) {
  gamma = newExpWaitingTime(0.2)
  beta = 0.1333
  n = 10000
  sim = Simulation$new(n)
  sim$addLogger(newCounter("S", "S"))
  sim$addLogger(newCounter("I", "I"))
  sim$addLogger(newCounter("R", "R"))
  # Generate a Poisson random network with an average degree 5.
  m = newConfigurationModel(function(n) rpois(n, 5))
  sim$addContact(m)
  sim$addTransition("I"->"R", gamma)#, changed_callback=changed_IR)
  sim$addTransition("I" + "S" -> "I" + "I" ~ m, beta) #, changed_callback=changed)
  for (i in 1:n) {
    sim$setState(i, if (i <= 10) "I" else "S")
  }
  observe({
    output$example_table <- renderTable(sim$run(0:100))
  }) %>% bindEvent(input$example)
})
