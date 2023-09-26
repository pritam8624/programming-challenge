# programming-challenge

Hello,

This task involves using test-driven development to write some Ruby code.

## Description ##

In the `search.xml` file is some XML output from a hypothetical rail
search API. The scenario is that we have performed a search from London
to Barcelona, and this is the output which we need to parse and display.

Unfortunately the real rail APIs are nowhere near this simple, but this
example provides more than enough complexity for the challenge!

Some definitions:

* There are 3 *search results*, representing different options for
  making the journey

* A search result has one or more *connections*, representing the
  individual train rides which make up the whole journey

* A *fare* represents the cost of travelling on this train in a given
  class of service (standard class, first class, etc). The currency is
  indicated in the XML, but it's always GBP (British Pounds) in our example.
  Please note that the decimal point (`.`) separates pence/cents from pounds,
  so `25.50` means 25 pounds and 50 pence.

## Your task ##

Your task is to write a program which will parse the XML file and output
information gleaned from the data.

The output should contain the following information for each search
result:

* ID of search result
* Description of each connection, including start/finish and departure/arrival times and train names. (Times in the XML response are in the timezone local to the station and should remain that way in the output)
* Duration of each connection (represented as hours and minutes)
* How many train changes need to be made
* How much time the passenger has for each train change (represented as hours and minutes)
* Duration of the whole journey (represented as hours and minutes)
* Fare names / prices for each connection
* The cheapest search result
* The quickest search result
