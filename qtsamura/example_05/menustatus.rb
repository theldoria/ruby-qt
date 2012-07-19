=begin
**
** menustatus.rb
** 31/JUL/2007
** Daniel Martin Gomez
**
** Desc:
**  This script shows how to use menu and status bars. It also provides a
** comprehensive example on how to add icons to the different actions of a
** menu.
**
** Version:
**  v1.0 [31/Jul/2007]: first released
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
=end

#require Qt4 bindings for ruby
require 'Qt4'

#require the compiled resources file
# In order to compile a .qrc file you will need the standard tool rbrcc whose syntax is as follows:
#   rbrcc resources.qrc -o resources.rb
require_relative 'resources'


class MenuWindow < Qt::MainWindow
  def initialize
    super

    # create the menu bar
    @menubar = Qt::MenuBar.new(self)
    @menubar.setObjectName('menubar')
    #@menubar.setGeometry(Qt::Rect.new(0, 0, 800, 28))

    # create the top level menu items
    @menuFile = Qt::Menu.new(@menubar)
    @menuFile.setObjectName('menuFile')
    @menuFile.setTitle('File')
    @menuHelp = Qt::Menu.new(@menubar)
    @menuHelp.setObjectName('menuHelp')
    @menuHelp.setTitle('&Help')

    # add the top level menu items to the menu bar
    @menubar.addAction(@menuFile.menuAction())
    @menubar.addAction(@menuHelp.menuAction())

    # create menu actions
    @actionOpen = Qt::Action.new(self)
    @actionOpen.setObjectName('actionOpen')
    @actionOpen.setText('Open')
    @actionOpen.setStatusTip('Open a new file')
    @actionOpen.setIcon(Qt::Icon.new("icons/fileopen.png"))

    @actionExit = Qt::Action.new(self)
    @actionExit.setObjectName('actionExit')
    @actionExit.setText('Exit')
    @actionExit.setStatusTip('Exit the applications')
    @actionExit.setShortcut('Ctrl+X')
    @actionExit.setIcon(self.style().standardIcon(Qt::Style::SP_TitleBarCloseButton))

    @actionAbout = Qt::Action.new(self)
    @actionAbout.setObjectName('actionAbout')
    @actionAbout.setText('About')
    @actionAbout.setStatusTip('Information about the application')
    @actionAbout.setIcon(Qt::Icon.new(':/icons/help.png'))

    # attach actions to top level menu items
    @menuFile.addAction(@actionOpen)
    @menuFile.addSeparator()
    @menuFile.addAction(@actionExit)

    @menuHelp.addAction(@actionAbout)



    # attach the bar to the window
    self.setMenuBar(@menubar)


    # create and attach the status bar
    @statusbar = Qt::StatusBar.new(self)
    @statusbar.setObjectName('statusbar')
    self.setStatusBar(@statusbar)

    # close window when Exit action is selected
    Qt::Object.connect(@actionExit, SIGNAL('activated()'), self, SLOT('close()'))
  end
end

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    w = MenuWindow.new
    w.show
    a.exec
end
