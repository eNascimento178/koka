module leap-test

import leap
import kunit

fun tests() [
  test("year not divisible by 4 in common year", fn() 
    val expected = False
    val actual   = leap-year(2015)

    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 2, not divisible by 4 in common year", fn() 
    val expected = False
    val actual   = leap-year(1970)

    assert/equal(expected,actual, bool/(==))
  ),
  test("year divisible by 4, not divisible by 100 in leap year", fn()
    val expected = True
    val actual   = leap-year(1996)

    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 4 and 5 is still a leap year", fn()
    val expected = True
    val actual   = leap-year(1960)

    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 100, not divisible by 400 in common year", fn ()
    val expected = False
    val actual   = leap-year(2100)
    
    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 100 but not by 3 is still not a leap year", fn()
    val expected = False
    val actual   = leap-year(1900)

    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 400 is leap year", fn()
    val expected = True
    val actual   = leap-year(2000)

    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 400 but not by 125 is still a leap year", fn()
    val expected = True
    val actual   = leap-year(2400)

    assert/equal(expected, actual, bool/(==))
  ),
  test("year divisible by 200, not divisible by 400 in common year", fn()
    val expected = False
    val actual   = leap-year(1800)

    assert/equal(expected, actual, bool/(==))
  )
]

fun kunit/run(tests:() -> <kunit> list<()>)
  tests().foreach(fn(test) test())

pub fun main()
  with defaultKUnitHandler
  tests.run
