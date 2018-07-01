# Notes for Lesson 20: Sampling Distributions

## Content

### Sample mean(s)
Comparing samples with other samples is possible by finding and comparing their means.

### Sampling Distribution:
The sampling distribution is the distribution of all possible sample means in a population. It is always normally distributed and identical to the population mean.

Example: 
```
All possible samples of a dice roll (N=6) with sample size n=2:
1, 1 (1.0)      1, 2 (1.5)      1, 3 (2.0)      1, 4 (2.5)      1, 5 (3.0)      1, 6 (3.5)  
2, 1 (1.5)      2, 2 (2.0)      2, 3 (2.5)      2, 4 (3.0)      2, 5 (3.5)      2, 6 (4.0)  
3, 1 (2.0)      3, 2 (2.5)      3, 3 (3.0)      3, 4 (3.5)      3, 5 (4.0)      3, 6 (4.5)  
4, 1 (2.5)      4, 2 (3.0)      4, 3 (3.5)      4, 4 (4.0)      4, 5 (4.5)      4, 6 (5.0)  
5, 1 (3.0)      5, 2 (3.5)      5, 3 (4.0)      5, 4 (4.5)      5, 5 (5.0)      5, 6 (5.5)  
6, 1 (3.5)      6, 2 (4.0)      6, 3 (4.5)      6, 4 (5.0)      6, 5 (5.5)      6, 6 (6.0)



The sampling distribution looks like this:
6 |                                     #
5 |                              #      #      #
4 |                       #      #      #      #      #                  
3 |                #      #      #      #      #      #      #           
2 |         #      #      #      #      #      #      #      #      #      
1 |  #      #      #      #      #      #      #      #      #      #      #
  +--------------------------------------------------------------------------
    1.0    1.5    2.0    2.5    3.0    3.5    4.0    4.5    5.0    5.5    6.0


```

### Standard Error:
The standard deviation of the sampling distribution is called Standard Error (SE). The relationship between sample size `n`, standard error `SE` and standard deviation of the population `SD` is: `√n = SD / SE`.

Example:
```
Using the data from the previous example, the sampling distribution look like this:
1, 1.5, 1.5, 2, 2, 2, 2.5, 2.5, 2.5, 2.5, 3, 3, 3, 3, 3, 3.5, 3.5, 3.5, 
3.5, 3.5, 3.5, 4, 4, 4, 4, 4, 4.5, 4.5, 4.5, 4.5, 5, 5, 5, 5.5, 5.5, 6

We calculate the square deviations and the sum of squares:
6.25 + 4 + 4 + 2.25 + 2.25 + 2.25 + 1 + 1 + 1 + 1 + 0.25 + 0.25 + 0.25 + 0.25 + 0.25 + 0 + 0 + 0 + 0 + 0 + 0 + 0.25 + 0.25 + 0.25 + 0.25 + 0.25 + 1 + 1 + 1 + 1 + 2.25 + 2.25 + 2.25 + 4 + 4 + 6.25 = 52.5

and finally the standard error:
SE = √(52.5 / 36) = 1.20761

Let's make sure this is correct:
√n = SE / SD
√2 = 3.5 / 1.20761



### Central Limit Theorem:
This theorem states that the sampling distribution is always normal as long as the sample size is large enough.

## Slide Notes
1. We can compare a sample with the population of all samples by comparing the mean of a sample to the means of the other samples.
2. The probability of rolling at least a 3 on a four-sided die (D4) is `2/4 = 0.5`.
3. The mean of the population `1, 2, 3, 4` (vertices on a D4) is calculated by dividing the sum of values by N: `10 / 4 = 2.5`.
4. We take all possible samples of 2 D4 rolls. The population size N is 16, because each die has 4 sides, thus a cast has `4 * 4 = 16` possible outcomes: `[(1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 3), (2, 4), (3, 1), (3, 2), (3, 3), (3, 4), (4, 1), (4, 2), (4, 3), (4, 4)]`
5. We calculate the mean for each sample: `[1.0, 1.5, 2.0, 2.5, 1.5, 2.0, 2.5, 3.0, 2.0, 2.5, 3.0, 3.5, 2.5, 3.0, 3.5, 4.0]`
6. We calculate the mean of all sample means, which is `2.5`. *Observation: The mean of sample means is identical to the mean of the population.*
7. The distribution of sample means is called **sampling distribution**. It is normally distributed. *Observation: This seems to be generally true, but I don't understand it completely.*
8. The probability that the average of 2D4 is greater than `3` is `0.375`. Out of the `16` possible samples, the following `6` have a mean of at least `3`: `[(2, 4), (3, 3), (3, 4), (4, 2), (4, 3), (4, 4)]`. The proportion of these samples relative to the population equals `6/16 = 0.375`.
9. Such calculations are only possible for very small populations, because the number of possible samples is N to the power of the sample size. (Thus, for sample size 2: `N=2: 4`, `N=3: 9`, `N=4: 16`, `N=5: 25` ... `N=100: 10,000`) However, there exists a more practical way to compare (the mean of) a single sample with other samples in the distribution. To do this, we have to calculate the **standard deviation of the sampling distribution**.
10. For now we name the standard deviation of the sampling distribution **SE**. We calculate the SD of the population and the SE:
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
13. SE denotes the standard deviation of distribution of sample means - or sampling distribution. We manipulate the previously shown formular to determine SE: 
```
    sigma/SE = sqrt(n)   | * SE
    sigma = sqrt(n) * SE | / sqrt(n)
    SE = sigma/sqrt(n)
```
14. We can now answer the question where on the distribution of sample means a sample will lie for any population. For all sampling distributions where every value is the mean of a sample of size n `SE = population SD / sqrt(n)`. This is callled the **Central Limit Theorem**. No matter the shape of a population, the sampling distribution of reasonably sized samples will be relatively normal. The SD of the sampling distribution is `SE = population SD / sqrt(n)`, as previously stated. SE stands for **standard error**.
