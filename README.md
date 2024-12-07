# Study control system

## Short Description

Console application, which allows you to control studying processes.

## Estimation (h)

16

## Topics

* Hash
* JSON
* CSV
* ARGV
* DateTime

## Requirements

1. * Set semester data
   * Set begin and end of semester
   * Set names of studying disciplines and all laboratory works with deadlines for this disciplines
2. * Mark finished laboratory works
   * Pick discipline
   * Pick finished laboratory work
3. Output studying status
4. Add arguments support for ruby script

**Example:**

* Input:

`ruby study_control_system.rb status`

* Output:

`Mathematic - finished: 2, pass: 2(lab work №2 till 10.05.2019, lab work №3 till 15.05.2019); Physics - done`
