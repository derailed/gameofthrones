# GotUI

Sample Angular application. This frontend connects to the Phoenix service and shows where
the various minions resides. Inter castle communication is handled by sending ravens.

A given minion can send a raven to a minion of another castle by using the following raven
message format:

castle| message where castle is composed of the castle name initials in lower-case. ie Castle Black => cb