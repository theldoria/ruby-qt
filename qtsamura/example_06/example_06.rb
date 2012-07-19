=begin
** example_06.rb
** 27/SEP/2007
** ETD-Software
**  - Daniel Martin Gomez <etd[-at-]nomejortu.com>
**
** Desc:
**   Qt example application to show the different types of connections betweeen
** signals and slots. Direct versus indirect.
**
** Version:
**  v1.0 [27/September/2007]: first released
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
=end

require 'Qt4'

class Ui_Form < Qt::Object
    attr_reader :qgridLayout
    attr_reader :splitter
    attr_reader :qwidget
    attr_reader :qvboxLayout
    attr_reader :btnAdd
    attr_reader :btnDel
    attr_reader :lcdNumber
    attr_reader :qwidget1
    attr_reader :qvboxLayout1
    attr_reader :horizontalSlider
    attr_reader :progressBar

    slots 'add_one()', 'del_one()'

    def setupUi(form)
    form.setObjectName("form")
    @qgridLayout = Qt::GridLayout.new(form)
    @qgridLayout.setObjectName("qgridLayout")
    @splitter = Qt::Splitter.new(form)
    @splitter.setObjectName("splitter")
    @splitter.setOrientation(Qt::Vertical)
    @qwidget = Qt::Widget.new(@splitter)
    @qwidget.setObjectName("qwidget")
    @qvboxLayout = Qt::VBoxLayout.new(@qwidget)
    @qvboxLayout.setObjectName("qvboxLayout")
    @btnAdd = Qt::PushButton.new(@qwidget)
    @btnAdd.setObjectName("btnAdd")

    @qvboxLayout.addWidget(@btnAdd)

    @btnDel = Qt::PushButton.new(@qwidget)
    @btnDel.setObjectName("btnDel")

    @qvboxLayout.addWidget(@btnDel)

    @lcdNumber = Qt::LCDNumber.new(@qwidget)
    @lcdNumber.setObjectName("lcdNumber")
    @lcdNumber.setMode(Qt::LCDNumber::Hex)
    @lcdNumber.setSegmentStyle(Qt::LCDNumber::Flat)
    @lcdNumber.setProperty("value", Qt::Variant.new(9))

    @qvboxLayout.addWidget(@lcdNumber)

    @splitter.addWidget(@qwidget)
    @qwidget1 = Qt::Widget.new(@splitter)
    @qwidget1.setObjectName("qwidget1")
    @qvboxLayout1 = Qt::VBoxLayout.new(@qwidget1)
    @qvboxLayout1.setObjectName("qvboxLayout1")
    @horizontalSlider = Qt::Slider.new(@qwidget1)
    @horizontalSlider.setObjectName("horizontalSlider")
    @horizontalSlider.setMaximum(100)
    @horizontalSlider.setValue(25)
    @horizontalSlider.setOrientation(Qt::Horizontal)

    @qvboxLayout1.addWidget(@horizontalSlider)

    @progressBar = Qt::ProgressBar.new(@qwidget1)
    @progressBar.setObjectName("progressBar")
    @progressBar.setValue(25)

    @qvboxLayout1.addWidget(@progressBar)

    @splitter.addWidget(@qwidget1)

    @qgridLayout.addWidget(@splitter, 0, 0, 1, 1)


    retranslateUi(form);

    size = Qt::Size.new(170, 196)
    size = size.expandedTo(form.minimumSizeHint())
    form.resize(size)

    Qt::Object.connect(@horizontalSlider, SIGNAL('valueChanged(int)'), @progressBar, SLOT('setValue(int)'))
    Qt::Object.connect(@btnAdd, SIGNAL('clicked()'), self, SLOT('add_one()'))
    Qt::Object.connect(@btnDel, SIGNAL('clicked()'), self, SLOT('del_one()'))

    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def retranslateUi(form)
    form.setWindowTitle(Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8))
    @btnAdd.setText(Qt::Application.translate("Form", "+1", nil, Qt::Application::UnicodeUTF8))
    @btnDel.setText(Qt::Application.translate("Form", "-1", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

    def add_one()
      @lcdNumber.display(@lcdNumber.intValue() + 1)
    end

    def del_one()
      @lcdNumber.display(@lcdNumber.intValue() - 1)
    end

end

module Ui
    class Form < Ui_Form
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_Form.new
    w = Qt::Widget.new
    u.setupUi(w)
    w.show
    a.exec
end
