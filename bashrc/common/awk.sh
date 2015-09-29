#!/bin/bash

function cx {
  awk "{ print \$$@ }"
}
