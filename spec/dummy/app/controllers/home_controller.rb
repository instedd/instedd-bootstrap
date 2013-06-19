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

class HomeController < ApplicationController

  def index
    @files = Dir["#{Rails.root}/app/views/examples/*.haml"].map{|p| File.basename(p, '.haml')}
  end

end