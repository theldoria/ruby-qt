=begin
** Form generated from reading ui file 'interface_file.ui'
**
** Created: lun oct 1 10:40:22 2007
**      by: Qt User Interface Compiler version 4.2.2
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt'

class Ui_Form
    attr_reader :qgridLayout
    attr_reader :label

    def setupUi(form)
    form.setObjectName("form")
    @qgridLayout = Qt::GridLayout.new(form)
    @qgridLayout.setObjectName("qgridLayout")
    @label = Qt::Label.new(form)
    @label.setObjectName("label")
    @label.setAlignment(Qt::AlignCenter)

    @qgridLayout.addWidget(@label, 0, 0, 1, 1)


    retranslateUi(form);

    size = Qt::Size.new(294, 157)
    size = size.expandedTo(form.minimumSizeHint())
    form.resize(size)


    Qt::MetaObject.connectSlotsByName(form)
    end # setupUi

    def retranslateUi(form)
    form.setWindowTitle(Qt::Application.translate("Form", "Form", nil, Qt::Application::UnicodeUTF8))
    @label.setText(Qt::Application.translate("Form", "Hellow World", nil, Qt::Application::UnicodeUTF8))
    end # retranslateUi

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
