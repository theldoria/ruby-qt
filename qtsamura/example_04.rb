=begin
** example_04.rb
** 26/SEP/2007
** ETD-Software
**  - Daniel Martin Gomez <etd[-at-]nomejortu.com>
**
** Desc:
**   Qt example application to show how the different widget layouts behave.
**
** Version:
**  v1.0 [26/September/2007]: first released
**
**
** License:
**   This program is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation, either version 3 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program.  If not, see <http://www.gnu.org/licenses/>.
**
=end

require 'Qt4'

class Dialogo < Qt::Dialog
  def set_layout(layout)
    widgets = []
    5.times do
      widgets << Qt::PushButton.new("button")
    end
    widgets.each do |wdgt|
      layout.addWidget(wdgt)
    end
    self.layout = layout
  end
end

app = Qt::Application.new(ARGV)

layouts = [Qt::HBoxLayout, Qt::VBoxLayout]#, Qt::GridLayout.new]

layouts.each do |layout|
  d = Dialogo.new
  d.set_layout(layout.new(d))
  d.show
end
app.exec

