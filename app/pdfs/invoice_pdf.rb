class InvoicePdf < Prawn::Document
  require 'prawn/table'

  def initialize(order, invoice, view)
    super()
    @order = order
    @order.invoice = invoice
    @view = view
    logo
    header
    customer_details
    details
    message
  end

  def logo() end

  def header
    text "#{@order.invoice.state.upcase}", :align => :right, size: 16, :color => "585858", :style => :bold
    text "INVOICE ID: #{@order.invoice.invoice_id}", :align => :right, size: 8, :color => "585858"
    text "CUSTOMER CALLSIGN: #{@order.user.callsign.upcase}", :align => :right, size: 8, :color => "585858"
    text "INVOICE DATE: #{@order.invoice.created_at.strftime("%d %B %Y")}", :align => :right, size: 8, :color => "585858"
    move_down 5
  end

  def customer_details
    move_down 10
    text "TO:", :size => 10, :style => :bold
    text "#{@order.user.profile.fullname.titleize}", :size => 10, :color => "585858"
    text "#{@order.user.profile.address}", :size => 8, :color => "585858"
    text "#{@order.user.profile.postcode} #{@order.user.profile.city}", :size => 8, :color => "585858"
    text "#{@order.user.profile.state}, #{@order.user.profile.country}", :size => 8, :color => "585858"
    text "Phone Number: #{@order.user.profile.phone_number}", :size => 8, :color => "585858"
    text "Email: #{@order.user.email}", :size => 8, :color => "585858"
    move_down 10
  end

  def details
    move_down 40
    text "LIST OF ITEM", :size => 11, :color => "585858", :style => :bold

    # data for children
    order = [
      ["No", "Item Name", "Price", "Quantity", "Total Price"],
      ["1", "#{@order.item.name}", "RM#{@order.item.exact_price}0", "#{@order.quantity}", "RM#{@order.price}0"]
    ]

    # @order.each_with_index do |f, index|
    #   order += [
    #     ["#{index + 1}", "#{f.item.name}", "#{f.item.exact_price}", "#{f.quantity}", "RM#{f.price}0"]
    #   ]
    # end

    table(order, :header => true, :cell_style => {:size => 8, :text_color => "585858"}, :width => 540) do
      cells.padding = 8
      columns(0).width = 30
      columns(2).width = 100
      columns(3).width = 72
      columns(4).width = 100
      row(0).font_style = :bold
    end

    # data for total price
    total_amount = [
      ["", "", "", "TOTAL", "RM#{@order.price}0"]
    ]

    table(total_amount, :header => true, :cell_style => {:size => 12, :text_color => "585858", align: :center}) do
      row(0).font_style = :bold
      columns(0..2).borders = []
      columns(0..2).width = 122.65
      columns(3).width = 72
      columns(4).width = 100
    end

  end

  def message
    move_down 50
    text '"THIS IS A COMPUTER-GENERATED DOCUMENT AND IT DOES NOT REQUIRE A SIGNATURE. THIS DOCUMENT SHALL NOT BE INVALIDATED SOLELY ON THE GROUND THAT IT IS NOT SIGNED. "', :color => "585858", :size => 7, :align => :center, :style => :bold
  end
end
