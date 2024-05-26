module hello-world-test

import hello-world
import kunit

fun tests() [
  test("Say hi!", fn() 
    val expected = "Hello, World!"

    val actual   = hello-world()

    assert/equal(expected, actual, string/(==))
  )
]

fun kunit/run(tests:() -> <kunit> list<()>)
  tests().foreach(fn(test) test())

pub fun main()
  with defaultKUnitHandler
  tests.run
