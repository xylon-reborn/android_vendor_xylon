# Versioning of the ROM

ifdef BUILDTYPE_NIGHTLY
	ROM_BUILDTYPE := NIGHTLY
endif
ifdef BUILDTYPE_AUTOTEST
	ROM_BUILDTYPE := AUTOTEST
endif
ifdef BUILDTYPE_EXPERIMENTAL
	ROM_BUILDTYPE := EXPERIMENTAL
endif
ifdef BUILDTYPE_RELEASE
	ROM_BUILDTYPE := RELEASE
endif

ifndef ROM_BUILDTYPE
	ROM_BUILDTYPE := HOMEMADE
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst revolution_,,$(TARGET_PRODUCT_SHORT))

# Build the final version string
ifdef BUILDTYPE_RELEASE
	ROM_VERSION := $(PLATFORM_VERSION)-$(TARGET_PRODUCT_SHORT)
else
	ROM_VERSION := $(PLATFORM_VERSION)-$(shell date -u +%Y%m%d)-$(TARGET_PRODUCT_SHORT)-$(ROM_BUILDTYPE)
endif

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
	ro.modversion=ORevolutionROM-$(ROM_VERSION) \
	ro.revolution.version=$(ROM_VERSION)
