test_that('Is country in data', {
  expect_true(any(WorldPopulation$Country == 'China'))
})

test_that('Is country in data', {
  expect_false(any(WorldPopulation$Country == 'USA'))
})
