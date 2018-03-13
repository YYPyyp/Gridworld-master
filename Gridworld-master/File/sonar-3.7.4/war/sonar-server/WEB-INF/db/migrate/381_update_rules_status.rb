#
# Sonar, entreprise quality control tool.
# Copyright (C) 2008-2013 SonarSource
# mailto:contact AT sonarsource DOT com
#
# SonarQube is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 3 of the License, or (at your option) any later version.
#
# SonarQube is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#

#
# Sonar 3.6
#
class UpdateRulesStatus < ActiveRecord::Migration

  class Rule < ActiveRecord::Base
  end

  def self.up
    Rule.reset_column_information
    Rule.update_all({:status => 'READY', :created_at => Time.now}, ['enabled=?', true])
    Rule.update_all({:status => 'REMOVED', :created_at => Time.now, :updated_at => Time.now}, ['enabled=?', false])
  end

end

