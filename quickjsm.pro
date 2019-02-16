TEMPLATE = subdirs

CONFIG += ordered

SUBDIRS += tests

tests.depends = builddlib
