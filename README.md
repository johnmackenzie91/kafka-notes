# Kafka Playground

## What the hell is this?

I am not too sure myself. It started out as a getting started with kafka and docker project.

I then moved onto [kafkacat](https://github.com/edenhill/kafkacat). See the make file for things I have done with that.


Then I added an schema-registry container. Spoiler alert, kafkacat does not support schema-registry. See Makefile to see how I interact with the schema-registry.

## Other notes

CBA to put main.go into its own container. If you wish to run it please run `go run *.go` in the root. 