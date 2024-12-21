################################################################################
#
# python-glad2
#
################################################################################

PYTHON_GLAD2_VERSION = 2.0.8
PYTHON_GLAD2_SITE = $(call github,Dav1dde,glad,v$(PYTHON_GLAD2_VERSION))
PYTHON_GLAD2_SETUP_TYPE = setuptools
PYTHON_GLAD2_LICENSE = MIT
PYTHON_GLAD2_LICENSE_FILES = LICENSE

PYTHON_GLAD2_DEPENDENCIES += python-jinja2

$(eval $(host-python-package))
