#!/usr/bin/env python3

import yaml
import os.path
import sys

if len(sys.argv) != 2:
	print("Syntax: ramlincludes.py <api.raml>", file=sys.stderr)
	sys.exit(-1)

ramlfile = sys.argv[1]
print(ramlfile)

class Loader(yaml.Loader):
	def __init__(self, stream):
		self._root = os.path.split(stream.name)[0]
		super(Loader, self).__init__(stream)

	def include(self, node):
		filename = os.path.join(self._root, self.construct_scalar(node))
		print(filename)
		#with open(filename, 'r') as f:
		#    return yaml.load(f, Loader)

Loader.add_constructor("!include", Loader.include)

raml = yaml.load(open(ramlfile), Loader)
