=begin
** example_07.rb
** 27/SEP/2007
** ETD-Software
**  - Daniel Martin Gomez <etd[-at-]nomejortu.com>
**
** Desc:
**   Qt example application to show how to perform indirect connections between
** signals and slots.
**
** Version:
**  v1.0 [27/September/2007]: first released
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

class LCDWindow < Qt::MainWindow
  slots 'add_one()', 'del_one()'
  
  def initialize
    super
    
    c = Qt::Widget.new
    
    btnAdd = Qt::PushButton.new("+1")
    btnDel = Qt::PushButton.new("-1")
    @lcd = Qt::LCDNumber.new
    
    layout = Qt::VBoxLayout.new
    layout.addWidget(btnAdd)
    layout.addWidget(btnDel)
    layout.addWidget(@lcd)
    
    c.layout = layout
    self.setCentralWidget(c)
    
    connect(btnAdd, SIGNAL('clicked()'), self, SLOT('add_one()'))
    connect(btnDel, SIGNAL('clicked()'), self, SLOT('del_one()'))
  end
  
  def add_one()
    @lcd.display(@lcd.intValue() + 1)
  end

  def del_one()
    @lcd.display(@lcd.intValue() - 1)
  end
end

app = Qt::Application.new(ARGV)
w = LCDWindow.new
w.show
app.exec
