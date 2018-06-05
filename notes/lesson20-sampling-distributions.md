# Notes for Lesson 20: Sampling Distributions

## Slide Notes
1. We can compare a sample with the population of all samples by comparing the mean of the sample to the others.
2. The probability of rolling at least a 3 on a four-sided die (D4) is `2/4 = 0.5`.
3. The mean of the population `1, 2, 3, 4` (vertices on a D4) is the sum of the population `10` divided by N `4`: `10 / 4 = 2.5`.
4. We take all possible samples of 2 D4 rolls, its population size N is 16, because 4 possible values times 4 possible values equal 16 outcomes: `[(1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 3), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4), (4, 1), (4, 2), (4, 3), (4, 4)]`
5. We calculate the mean for each sample: `[1.0, 1.5, 2.0, 2.5, 1.5, 2.0, 2.5, 3.0, 2.0, 2.5, 3.0, 3.5, 2.5, 3.0, 3.5, 4.0]`
6. We calculate the mean of all sample means, which is `2.5`. *Observation: The mean of sample means is identical to the mean of the population.*
7. The distribution of sample means is called **sampling distribution**. It is normally distributed. *Observation: This seems to be generally true, but I don't understand it completely.*
8. The probability that the average of 2D4 is greater than `3` is `0.375`. Out of the `16` possible samples, the following `6` have a mean of at least `3`: `[(2, 4), (3, 3), (3, 4), (4, 2), (4, 3), (4, 4)]`. The proportion of these samples relative to the population equals `6/16 = 0.375`.
9. Such calculations are only possible for very small populations, because the number of possible samples is N to the power of the sample size. (Thus, for sample size 2: `N=2: 4`, `N=3: 9`, `N=4: 16`, `N=5: 25` ... `N=100: 10,000`) However, there exists a more practical way to compare (the mean of) a single sample with other samples in the distribution. To do this, we have to calculate the **standard deviation of the sampling distribution**.
10. We call the standard deviation of the sampling distribution **SE**. We calculate the SD of the population and the SE:
```
  data: [1, 1.5, 2, 2.5, 1.5, 2, 2.5, 3, 2, 2.5, 3, 3.5, 2.5, 3, 3.5, 4]
  len : 16
  µ   : 2.5
  ds  : [-1.5, -1.0, -0.5, 0.0, -1.0, -0.5, 0.0, 0.5, -0.5, 0.0, 0.5, 1.0, 0.0, 0.5, 1.0, 1.5]
  ss  : 10.0
  var : 0.625
  sd  : 0.7905694150420949

  data: [1, 2, 3, 4]
  len : 4
  µ   : 2.5
  ds  : [-1.5, -0.5, 0.5, 1.5]
  ss  : 5.0
  var : 1.25
  sd  : 1.118033988749895
```
11. The population SD (sigma) and the SD of the sampling distribution have a relationship to each other.
12. The ratio of the population SD (sigma) to SE equals `1.4142135623730951`, which is the square root of 2. *Observation: Let n be the sample size, the relationship between sigma, SE and n is `sigma/SE = sqrt(n)`.*
