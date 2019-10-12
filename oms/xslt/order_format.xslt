<?xml version="1.0"?>
<files>
<file filename="Klikmro_%lastincrementid%.xml">
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
<xsl:output method="xml"/>
<xsl:template match="/">
<order>
<xsl:for-each select="orders/order">
  <id><xsl:value-of select="entity_id"/></id>
  <increment_id><xsl:value-of select="increment_id"/></increment_id>
  <channel_code><xsl:text>MRO</xsl:text></channel_code>
  <email><xsl:value-of select="customer_email"/></email>
  <firstname>
  <xsl:choose>
  <xsl:when test="customer_is_guest!=1">
    <xsl:value-of select="shipping/firstname"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:value-of select="customer_firstname"/>
  </xsl:otherwise>
  </xsl:choose>
  </firstname>
  <lastname>
  <xsl:choose>
  <xsl:when test="customer_is_guest!=1">
    <xsl:value-of select="shipping/lastname"/>
  </xsl:when>
  <xsl:otherwise>
    <xsl:value-of select="customer_lastname"/>
  </xsl:otherwise>
  </xsl:choose>
  </lastname>
  <company><xsl:value-of select="shipping/company"/></company> 
  <ordered_at><xsl:value-of select="php:functionString('strftime', '%Y-%m-%d %H:%M:%S', created_at_timestamp)"/></ordered_at>
  <status><xsl:value-of select="status"/></status>
  <customer_group><xsl:value-of    select="customer/customer_group"/></customer_group>
  <shipping_longitude><xsl:value-of    select="shipping_longitude"/></shipping_longitude>
  <shipping_latitude><xsl:value-of    select="shipping_latitude"/></shipping_latitude>
  <forward_address><xsl:value-of    select="shipping/forward_address"/></forward_address>
  <grand_total><xsl:value-of    select="grand_total"/></grand_total>
  <gift_cards><xsl:value-of select="gift_cards"/></gift_cards>
  <shipping_address>
    <address><xsl:value-of select="shipping/street"/></address>
    <city><xsl:value-of select="shipping/city"/></city> 
    <postal_code><xsl:value-of select="shipping/postcode"/></postal_code> 
    <state><xsl:value-of select="shipping/region_code"/></state> 
    <country><xsl:value-of select="shipping/country_id"/></country> 
    <phone><xsl:value-of select="shipping/telephone"/></phone> 
  </shipping_address>
  <billing_address>
    <address><xsl:value-of select="billing/street"/></address>
    <city><xsl:value-of select="billing/city"/></city> 
    <postal_code><xsl:value-of select="billing/postcode"/></postal_code> 
    <state><xsl:value-of select="billing/region_code"/></state> 
    <country><xsl:value-of select="billing/country_id"/></country> 
    <phone><xsl:value-of select="billing/telephone"/></phone> 
  </billing_address>
  <payment> 
    <payment_method><xsl:value-of select="payment/method"/></payment_method> 
  </payment>
  <shipping>
    <shipping_method><xsl:value-of    select="shipping_method"/></shipping_method>
    <shipping_cost><xsl:value-of    select="shipping_amount"/></shipping_cost>
  </shipping>
  <custom_order_attribute>
    <remark><xsl:value-of    select="amasty_orderattributes/remark"/></remark>
    <customer_po_no><xsl:value-of    select="amasty_orderattributes/customer_po_no"/></customer_po_no>
    <payer_firstname><xsl:value-of    select="amasty_orderattributes/payer_firstname"/></payer_firstname>
    <payer_lastname><xsl:value-of    select="amasty_orderattributes/payer_lastname"/></payer_lastname>
    <payer_address1><xsl:value-of    select="amasty_orderattributes/payer_address1"/></payer_address1>
    <payer_address2><xsl:value-of    select="amasty_orderattributes/payer_address2"/></payer_address2>
    <payer_postcode><xsl:value-of    select="amasty_orderattributes/payer_postcode"/></payer_postcode>
    <payer_city><xsl:value-of    select="amasty_orderattributes/payer_city"/></payer_city>
    <payer_province><xsl:value-of    select="amasty_orderattributes/payer_province"/></payer_province>
    <payer_npwp><xsl:value-of    select="amasty_orderattributes/payer_npwp"/></payer_npwp>
    <payer_email><xsl:value-of    select="amasty_orderattributes/payer_email"/></payer_email>
    <reqdlvdate><xsl:value-of    select="amasty_orderattributes/reqdlvdate"/></reqdlvdate>
    <shipcond><xsl:value-of    select="shipcond"/></shipcond>
    <site><!--<xsl:value-of    select="site"/>--></site>
    <affiliate_nip><xsl:value-of    select="affliate_nip"/></affiliate_nip>
    <indent_shipping_method><xsl:value-of    select="indent_shipping_method"/></indent_shipping_method>
    <salesman_id><xsl:value-of    select="customer/salesman_id"/></salesman_id>
    <subcompany_sap><xsl:value-of    select="customer/subcompany_sap"/></subcompany_sap>
    <shipping_address_sap_id><xsl:value-of    select="shipping/address_sap_id"/></shipping_address_sap_id>
    <billing_address_sap_id><xsl:value-of    select="billing/address_sap_id"/></billing_address_sap_id>
    <tax_classification><xsl:value-of    select="tax_classification"/></tax_classification>
    <salesman_code><xsl:value-of    select="affiliate_salesman_code"/></salesman_code>
    <shipping_discount_amount><xsl:value-of    select="shipping_discount_amount"/></shipping_discount_amount>
    <company><xsl:value-of  select="customer/addresses/address/company"/></company>
  </custom_order_attribute>
  
  <item_lines>
      <xsl:for-each select="items/item">
        <item>
          <sku><xsl:value-of select="sku"/></sku> 
          <qty><xsl:value-of select="round(qty_ordered)"/></qty> 
          <base_price>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/base_price"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="base_price"/>
            </xsl:otherwise>
          </xsl:choose>
          </base_price>
          <sell_price>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/price"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="price"/>
            </xsl:otherwise>
          </xsl:choose></sell_price>
          <discount_amount>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/discount_amount"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="discount_amount"/>
            </xsl:otherwise>
          </xsl:choose>
          </discount_amount>
          <tax>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/tax_amount"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tax_amount"/>
            </xsl:otherwise>
          </xsl:choose>
          </tax>
          <is_pickup>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/is_pickup"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="is_pickup"/>
            </xsl:otherwise>
          </xsl:choose>
          </is_pickup>
          <is_hubpickup>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/is_hubpickup"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="is_hubpickup"/>
            </xsl:otherwise>
          </xsl:choose>
          </is_hubpickup>
          <loc_code>
          <xsl:choose>
            <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                <xsl:value-of select="parent_item/loc_code"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="loc_code"/>
            </xsl:otherwise>
          </xsl:choose>
          </loc_code>
          <custom_item_attribute>
            <klikmro_sku><xsl:value-of select="product_attributes/klikmro_sku"/></klikmro_sku>
            <vendor_id><xsl:value-of select="product_attributes/vendor_id"/></vendor_id>
            <vendor_sku><xsl:value-of select="product_attributes/vendor_sku"/></vendor_sku>
            <delivery><xsl:value-of select="product_attributes/delivery"/></delivery>
            <pdt><xsl:value-of select="product_attributes/pdt"/></pdt>
            <qty_backordered>
            <xsl:choose>
            <xsl:when test="qty_backordered!=''"><xsl:value-of select="round(qty_backordered)"/></xsl:when>
            <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
            </xsl:choose>
            </qty_backordered>
            <is_indent>
                   <xsl:choose>
                <xsl:when test="product_attributes/indent='1'"><xsl:text>1</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
                </xsl:choose>
            </is_indent>
            <is_preorder>
                <xsl:choose>
                <xsl:when test="product_attributes/preorder='1'"><xsl:text>1</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
                </xsl:choose>
            </is_preorder>
            <row_total>
              <xsl:choose>
                <xsl:when test="parent_item_id!='Unset' or parent_item_id!='NULL'">
                    <xsl:value-of select="parent_item/row_total - parent_item/discount_amount + parent_item/tax_amount"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="row_total - discount_amount + tax_amount"/>
                </xsl:otherwise>
              </xsl:choose>
            </row_total>
            <sap_sku><xsl:value-of select="product_attributes/sap_sku"/></sap_sku>
            <cost><xsl:value-of select="product_attributes/cost"/></cost>
          </custom_item_attribute>
        </item>
      </xsl:for-each>
  </item_lines>
</xsl:for-each>
</order>
</xsl:template>
</xsl:stylesheet>
</file>
</files>