# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from nextgisweb.component import Component
from .model import Base


@Component.registry.register
class MobileDebugComponent(Component):
    identity = 'mobile_debug'
    metadata = Base.metadata

    def initialize(self):
        pass

    def setup_pyramid(self, config):
        from . import view  # NOQA
        view.setup_pyramid(self, config)


def pkginfo():
    return dict(components=dict(
        mobile_debug="nextgisweb_mobile_debug"))


def amd_packages():
    return ((
        'ngw-mobile-debug', 'nextgisweb_mobile_debug:amd/ngw-mobile-debug'),
    )
