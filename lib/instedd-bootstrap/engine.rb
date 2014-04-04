# Copyright (C) 2013, InSTEDD
#
# This file is part of InSTEDD Bootstrap.
#
# InSTEDD Bootstrap is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# InSTEDD Bootstrap is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with InSTEDD Bootstrap.  If not, see <http://www.gnu.org/licenses/>.

module InsteddBootstrap
  class Engine < ::Rails::Engine
    isolate_namespace InsteddBootstrap

    config.to_prepare do
      require_dependency InsteddBootstrap::Engine.root.join('app', 'helpers', 'instedd_bootstrap', 'application_helper').to_s
      require_dependency InsteddBootstrap::Engine.root.join('lib', 'instedd-bootstrap', 'breadcrumbs').to_s
    end

    if Rails.env.development?
      config.after_initialize do
        # optional, without it will call `to_prepare` only when a file changes,
        # not on every request
        Rails.application.config.reload_classes_only_on_change = false
      end
    end
  end
end
