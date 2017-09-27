# GoT UI

Game of Thrones Angular front end application. This app connects to the GoT web service and shows where the various minions resides. Inter-castle communication is handled by sending raven messages.

A given Minion can send a Raven to a Castle by using the following raven
message format:

> castle| message

Where castle is composed of the castle name initials in lower-case. ie Castle Black => cb