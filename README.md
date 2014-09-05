ruby_samples
============

Sample from ruby quizzes


Reducer solution for Ruby Code quiz
-----------------------------------
A local variable named log contains an array of hashes with timestamped events like so

    log = [
      {time: 201201, x: 2},
      {time: 201201, y: 7},
      {time: 201201, z: 2},
      {time: 201202, a: 3},
      {time: 201202, b: 4},
      {time: 201202, c: 0}
    ]

Please collapse the log by date into an array of hashes containing one entry per day

    [
      {time: 201201, x: 2, y: 7, z: 2},
      {time: 201202, a: 3, b: 4, c: 0},
    ]


Ordering in the input is not defined. Ordering in the result is not important. Do not rely on the names of the hash keys other than :time. The field below executes your code in a Sandbox with $SAFE=4, so you can't define new classes, use global variables, etc. The field will turn green if your solution returns a correct object.
