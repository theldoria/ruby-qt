=begin
** example_02.rb
** 26/SEP/2007
** ETD-Software
**  - Daniel Martin Gomez <etd[-at-]nomejortu.com>
**
** Desc:
**   Qt example application to show the behaviour of the dock widgets and the
** main window areas.
**
** Version:
**  v1.0 [26/September/2007]: first released
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

class Ui_MainWindow
    attr_reader :centralwidget
    attr_reader :qgridLayout
    attr_reader :label
    attr_reader :menubar
    attr_reader :statusbar
    attr_reader :dockWidget
    attr_reader :dockWidgetContents
    attr_reader :qgridLayout1
    attr_reader :label_2
    attr_reader :dockWidget_2
    attr_reader :dockWidgetContents_2
    attr_reader :qgridLayout2
    attr_reader :label_3
    attr_reader :dockWidget_3
    attr_reader :dockWidgetContents_3
    attr_reader :qgridLayout3
    attr_reader :label_4
    attr_reader :dockWidget_4
    attr_reader :dockWidgetContents_4
    attr_reader :qgridLayout4
    attr_reader :label_5

    def setupUi(mainWindow)
    mainWindow.setObjectName("mainWindow")
    @font = Qt::Font.new
    @font.setPointSize(14)
    mainWindow.setFont(@font)
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.setObjectName("centralwidget")
    @qgridLayout = Qt::GridLayout.new(@centralwidget)
    @qgridLayout.setObjectName("qgridLayout")
    @label = Qt::Label.new(@centralwidget)
    @label.setObjectName("label")
    @label.setAlignment(Qt::AlignCenter)

    @qgridLayout.addWidget(@label, 0, 0, 1, 1)

    mainWindow.setCentralWidget(@centralwidget)
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.setObjectName("menubar")
    @menubar.setGeometry(Qt::Rect.new(0, 0, 517, 35))
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.setObjectName("statusbar")
    mainWindow.setStatusBar(@statusbar)
    @dockWidget = Qt::DockWidget.new(mainWindow)
    @dockWidget.setObjectName("dockWidget")
    @dockWidget.setAutoFillBackground(false)
    @dockWidget.setAllowedAreas(Qt::TopDockWidgetArea)
    @dockWidgetContents = Qt::Widget.new(@dockWidget)
    @dockWidgetContents.setObjectName("dockWidgetContents")
    @qgridLayout1 = Qt::GridLayout.new(@dockWidgetContents)
    @qgridLayout1.setObjectName("qgridLayout1")
    @label_2 = Qt::Label.new(@dockWidgetContents)
    @label_2.setObjectName("label_2")
    @label_2.setAlignment(Qt::AlignCenter)

    @qgridLayout1.addWidget(@label_2, 0, 0, 1, 1)

    @dockWidget.setWidget(@dockWidgetContents)
    mainWindow.addDockWidget(4, @dockWidget)
    @dockWidget_2 = Qt::DockWidget.new(mainWindow)
    @dockWidget_2.setObjectName("dockWidget_2")
    @dockWidget_2.setAllowedAreas(Qt::LeftDockWidgetArea)
    @dockWidgetContents_2 = Qt::Widget.new(@dockWidget_2)
    @dockWidgetContents_2.setObjectName("dockWidgetContents_2")
    @qgridLayout2 = Qt::GridLayout.new(@dockWidgetContents_2)
    @qgridLayout2.setObjectName("qgridLayout2")
    @label_3 = Qt::Label.new(@dockWidgetContents_2)
    @label_3.setObjectName("label_3")
    @label_3.setAlignment(Qt::AlignCenter)

    @qgridLayout2.addWidget(@label_3, 0, 0, 1, 1)

    @dockWidget_2.setWidget(@dockWidgetContents_2)
    mainWindow.addDockWidget(1, @dockWidget_2)
    @dockWidget_3 = Qt::DockWidget.new(mainWindow)
    @dockWidget_3.setObjectName("dockWidget_3")
    @dockWidget_3.setAllowedAreas(Qt::RightDockWidgetArea)
    @dockWidgetContents_3 = Qt::Widget.new(@dockWidget_3)
    @dockWidgetContents_3.setObjectName("dockWidgetContents_3")
    @qgridLayout3 = Qt::GridLayout.new(@dockWidgetContents_3)
    @qgridLayout3.setObjectName("qgridLayout3")
    @label_4 = Qt::Label.new(@dockWidgetContents_3)
    @label_4.setObjectName("label_4")
    @label_4.setAlignment(Qt::AlignCenter)

    @qgridLayout3.addWidget(@label_4, 0, 0, 1, 1)

    @dockWidget_3.setWidget(@dockWidgetContents_3)
    mainWindow.addDockWidget(2, @dockWidget_3)
    @dockWidget_4 = Qt::DockWidget.new(mainWindow)
    @dockWidget_4.setObjectName("dockWidget_4")
    @dockWidget_4.setAllowedAreas(Qt::BottomDockWidgetArea)
    @dockWidgetContents_4 = Qt::Widget.new(@dockWidget_4)
    @dockWidgetContents_4.setObjectName("dockWidgetContents_4")
    @qgridLayout4 = Qt::GridLayout.new(@dockWidgetContents_4)
    @qgridLayout4.setObjectName("qgridLayout4")
    @label_5 = Qt::Label.new(@dockWidgetContents_4)
    @label_5.setObjectName("label_5")
    @label_5.setAlignment(Qt::AlignCenter)

    @qgridLayout4.addWidget(@label_5, 0, 0, 1, 1)

    @dockWidget_4.setWidget(@dockWidgetContents_4)
    mainWindow.addDockWidget(8, @dockWidget_4)

    retranslateUi(mainWindow);

    size = Qt::Size.new(517, 391)
    size = size.expandedTo(mainWindow.minimumSizeHint())
    mainWindow.resize(size)


    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def retranslateUi(mainWindow)
    mainWindow.setWindowTitle(Qt::Application.translate("MainWindow", "Example 2", nil, Qt::Application::UnicodeUTF8))
    @label.setText(Qt::Application.translate("MainWindow", "Central Widget", nil, Qt::Application::UnicodeUTF8))
    @label_2.setText(Qt::Application.translate("MainWindow", "Top Docking Area", nil, Qt::Application::UnicodeUTF8))
    @label_3.setText(Qt::Application.translate("MainWindow", "Left Docking Area", nil, Qt::Application::UnicodeUTF8))
    @label_4.setText(Qt::Application.translate("MainWindow", "Right Docking Area", nil, Qt::Application::UnicodeUTF8))
    @label_5.setText(Qt::Application.translate("MainWindow", "Bottom Docking Area", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_MainWindow.new
    w = Qt::MainWindow.new
    u.setupUi(w)
    w.show
    a.exec
end
