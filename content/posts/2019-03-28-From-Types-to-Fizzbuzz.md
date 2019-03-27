---
layout: post
date: 2019-03-28T20:21:51-07:00
title: From Types to FizzBuzz
draft: true
description: It's quite possible that I was so preoccupied with whether or not I could, that I didn’t stop to think if I should.
tags:
- math
- software
---

For each number N from 1 to 100, if N is...

* ...disible by 3, output "Fizz".
* ...divisible by 5, output "Buzz".
* ...divisible by both 3 and 5, output "FizzBuzz".
* ...otherwise, output the number itself.

# Baby Steps

First we define the natural numbers by the usual construction
```rust
struct Zero; // ahem, zero.
struct S<N>; // The "successor" of N aka N + 1
```

We hit our first roadblock, but `rustc` is quite helpful

```
error[E0392]: parameter `N` is never used
 --> src/lib.rs:2:10
  |
2 | struct S<N>;
  |          ^ unused type parameter
  |
  = help: consider removing `N` or using a marker such as `std::marker::PhantomData`
```

Let's go ahead and fix this.

```rust
use std::marker::PhantomData;

struct S<N>(PhantomData<N>); // The "successor" of N aka N + 1
```

Add a few helpful aliases...

```rust
type N1 = S<Zero>;
type N2 = S<N1>;
type N3 = S<N2>;
type N4 = S<N3>;
type N5 = S<N4>;
```

How quickly we're moving along!

