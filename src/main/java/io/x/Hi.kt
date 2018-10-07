package io.x

import kotlinx.coroutines.experimental.async
import kotlinx.coroutines.experimental.delay
import kotlinx.coroutines.experimental.runBlocking

fun main(args: Array<String>) {
  println("Hi from kotlin")
  runBlocking {
    val msg = async {
      think()
    }
    println("before delay")
    println(msg.await())
    println("after delay")
  }
}

private suspend fun think(): String {
  delay(100)
  return "after delay"
}
