
import module namespace ediQ = "http://www.sunpower.com/middleware/realtime/edicom/xquery/1.0" at "../../Edicom_Agent/xquery/Edicom_Agent.xq";
import module namespace functx = "http://www.common.functx.com" at "../../Edicom_Common/xquery/functx-xquery-functions.xq";

declare namespace das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd";
declare variable $gConfiguration := doc('../config/gConfiguration_945.xml')/*/.;

declare variable $gdataAccessResponse := doc('../sample-data/940/dataAccessResponse.xml')/*/.;

declare variable $gHeader:=<type xmlns:ns2="http://schemas.active-endpoints.com/engineapi/2010/05/EngineAPITypes.xsd"
      xmlns:ns3="http://schemas.active-endpoints.com/engineapi/2010/09/ProcessManagementTypes.xsd"
      xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
  <HEADER>
      <CONTROL_NUMBER>1344333</CONTROL_NUMBER>
      <HEADER_ID>1001</HEADER_ID>
      <DELIVERY_NUMBER>7816326</DELIVERY_NUMBER>
      <PACKING_SLIP>PL-14066604</PACKING_SLIP>
      <BILL_TO_COUNTRY>US</BILL_TO_COUNTRY>
      <BILL_TO_POSTAL_CODE>19601</BILL_TO_POSTAL_CODE>
      <BILL_TO_CITY>Reading</BILL_TO_CITY>
      <BILL_TO_REGION>US</BILL_TO_REGION>
      <BILL_TO_ADDRESS3>Reading</BILL_TO_ADDRESS3>
      <BILL_TO_ADDRESS2>419 Douglass_St</BILL_TO_ADDRESS2>
      <BILL_TO_ADDRESS1>103616</BILL_TO_ADDRESS1>
      <SHIP_TO_COUNTRY>US</SHIP_TO_COUNTRY>
      <SHIP_TO_POSTAL_CODE>19601</SHIP_TO_POSTAL_CODE>
      <SHIP_TO_CITY>Reading</SHIP_TO_CITY>
      <SHIP_TO_REGION>US</SHIP_TO_REGION>
      <SHIP_TO_ADDRESS3>Reading</SHIP_TO_ADDRESS3>
      <SHIP_TO_ADDRESS2>419 Douglass St</SHIP_TO_ADDRESS2>
      <SHIP_TO_ADDRESS1>103616</SHIP_TO_ADDRESS1>
      <BUSINESS_GROUP>SunPower Systems Sarl (SPSW OU)</BUSINESS_GROUP>
      <SHIP_TO_CONTACT_PHONE>5198223089</SHIP_TO_CONTACT_PHONE>
      <SHIPPING_INSTRUCTIONS>None</SHIPPING_INSTRUCTIONS>
      <FOB_CODE>Port of Destination</FOB_CODE>
      <SHIP_TO_CONTACT_NAME>SOLARDELPHIA</SHIP_TO_CONTACT_NAME>
      <SOURCE_WAREHOUSE>C21</SOURCE_WAREHOUSE>
      <DESTINATION_WAREHOUSE_CODE>W03</DESTINATION_WAREHOUSE_CODE>
      <SCAC_CODE>RYDR</SCAC_CODE>
      <ACTUAL_SHIP_DATE>42167</ACTUAL_SHIP_DATE>
      <SCHEDULED_ARRIVAL_DATE>42168</SCHEDULED_ARRIVAL_DATE>
      <FREIGHT_TERMS_CODE>DDP</FREIGHT_TERMS_CODE>
      <WAYBILL>1022133</WAYBILL>
      <LOAD_NUMBER>876628923</LOAD_NUMBER>
      <TRACKING_NUMBER>TX2342</TRACKING_NUMBER>
      <ATTRIBUTE1/>
      <ATTRIBUTE2/>
      <ATTRIBUTE3/>
      <ATTRIBUTE4/>
      <ATTRIBUTE5/>
      <FILE_NAME>DEL_US_RYDER.xml</FILE_NAME>
      <DESTINATION_PROJECT_NAME>Solar Star</DESTINATION_PROJECT_NAME>
      <DESTINATION_PROJECT_NUMBER>123322</DESTINATION_PROJECT_NUMBER>
      <SHIPPING_MODE>TL</SHIPPING_MODE>
      <SERVICE_LEVEL>Express</SERVICE_LEVEL>
      <LICENCE_PLATES>
         <LICENCE_PLATE>
            <LPN_NUMBER>LPN01</LPN_NUMBER>
            <PACK_TYPE>Pallet</PACK_TYPE>
            <WEIGHT>10</WEIGHT>
            <HEIGHT>1</HEIGHT>
            <LENGTH>1</LENGTH>
            <WIDTH>1</WIDTH>
            <WEIGHT_UOM>LBS</WEIGHT_UOM>
            <LINEAR_UOM>IN</LINEAR_UOM>
            <TRACKING_NUMBER>TN1023</TRACKING_NUMBER>
            <ATTRIBUTE1/>
            <ATTRIBUTE2/>
            <ATTRIBUTE3/>
            <ATTRIBUTE4/>
            <ATTRIBUTE5/>
            <LINE_ITEMS>
               <LINE_ITEM>
                  <LINE_ID_REFERENCE>129438</LINE_ID_REFERENCE>
                  <SHIPPED_ITEM>509665</SHIPPED_ITEM>
                  <SHIPPED_ITEM_DESCRIPTION>PVM, SPR-E20-435-COM, 4 PV4 1KV</SHIPPED_ITEM_DESCRIPTION>
                  <SHIPPED_QUANTITY>2</SHIPPED_QUANTITY>
                  <SHIPPED_QTY_UOM>EA</SHIPPED_QTY_UOM>
                  <SOURCE_SUBINVENTORY>1403</SOURCE_SUBINVENTORY>
                  <SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>33</SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>
                  <PACKING_INSTRUCTIONS>Packed</PACKING_INSTRUCTIONS>
                  <CUSTOMER_PO_NUMBER>18738732</CUSTOMER_PO_NUMBER>
                  <SALES_ORDER_NUMBER>12332849</SALES_ORDER_NUMBER>
                  <SALES_ORDER_LINE_NUMBER>4</SALES_ORDER_LINE_NUMBER>
                  <INTERNAL_REQUISITION_NUMBER>987823723</INTERNAL_REQUISITION_NUMBER>
                  <INTERNAL_REQ_LINE_NUMBER>4</INTERNAL_REQ_LINE_NUMBER>
                  <ATTRIBUTE1/>
                  <ATTRIBUTE2/>
                  <ATTRIBUTE3/>
                  <ATTRIBUTE4/>
                  <ATTRIBUTE5/>
                  <SERIAL_LINE_ITEMS>
                     <SERIAL_LINE_ITEM>
                        <SERIAL_NUMBER>L38424238</SERIAL_NUMBER>
                        <ATTRIBUTE1>Note1</ATTRIBUTE1>
                        <ATTRIBUTE2/>
                        <ATTRIBUTE3/>
                        <ATTRIBUTE4/>
                        <ATTRIBUTE5/>
                     </SERIAL_LINE_ITEM>
                     <SERIAL_LINE_ITEM>
                        <SERIAL_NUMBER>L87878787</SERIAL_NUMBER>
                        <ATTRIBUTE1>Note123</ATTRIBUTE1>
                        <ATTRIBUTE2/>
                        <ATTRIBUTE3/>
                        <ATTRIBUTE4/>
                        <ATTRIBUTE5/>
                     </SERIAL_LINE_ITEM>
                  </SERIAL_LINE_ITEMS>
               </LINE_ITEM>
               <LINE_ITEM>
                  <LINE_ID_REFERENCE>129439</LINE_ID_REFERENCE>
                  <SHIPPED_ITEM>510979</SHIPPED_ITEM>
                  <SHIPPED_ITEM_DESCRIPTION>PVM, SPR-250NE-WHT-J AR-A7 M3 YUK1</SHIPPED_ITEM_DESCRIPTION>
                  <SHIPPED_QUANTITY>1</SHIPPED_QUANTITY>
                  <SHIPPED_QTY_UOM>EA</SHIPPED_QTY_UOM>
                  <SOURCE_SUBINVENTORY>1403</SOURCE_SUBINVENTORY>
                  <SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>17</SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>
                  <PACKING_INSTRUCTIONS>Packed</PACKING_INSTRUCTIONS>
                  <CUSTOMER_PO_NUMBER>18738732</CUSTOMER_PO_NUMBER>
                  <SALES_ORDER_NUMBER>12332849</SALES_ORDER_NUMBER>
                  <SALES_ORDER_LINE_NUMBER>4</SALES_ORDER_LINE_NUMBER>
                  <INTERNAL_REQUISITION_NUMBER>987823723</INTERNAL_REQUISITION_NUMBER>
                  <INTERNAL_REQ_LINE_NUMBER>1</INTERNAL_REQ_LINE_NUMBER>
                  <ATTRIBUTE1>Note1</ATTRIBUTE1>
                  <ATTRIBUTE2/>
                  <ATTRIBUTE3/>
                  <ATTRIBUTE4/>
                  <ATTRIBUTE5/>
                  <SERIAL_LINE_ITEMS>
                     <SERIAL_LINE_ITEM>
                        <SERIAL_NUMBER>L12123132</SERIAL_NUMBER>
                        <ATTRIBUTE1>Note12324</ATTRIBUTE1>
                        <ATTRIBUTE2/>
                        <ATTRIBUTE3/>
                        <ATTRIBUTE4/>
                        <ATTRIBUTE5/>
                     </SERIAL_LINE_ITEM>
                  </SERIAL_LINE_ITEMS>
               </LINE_ITEM>
            </LINE_ITEMS>
         </LICENCE_PLATE>
      </LICENCE_PLATES>
   </HEADER>
   <HEADER>
      <CONTROL_NUMBER>1344333</CONTROL_NUMBER>
      <HEADER_ID>1002</HEADER_ID>
      <DELIVERY_NUMBER>7816327</DELIVERY_NUMBER>
      <PACKING_SLIP>PL-14066605</PACKING_SLIP>
      <BILL_TO_COUNTRY>US</BILL_TO_COUNTRY>
      <BILL_TO_POSTAL_CODE>19601</BILL_TO_POSTAL_CODE>
      <BILL_TO_CITY>Reading</BILL_TO_CITY>
      <BILL_TO_REGION>US</BILL_TO_REGION>
      <BILL_TO_ADDRESS3>Reading</BILL_TO_ADDRESS3>
      <BILL_TO_ADDRESS2>419 Douglass St</BILL_TO_ADDRESS2>
      <BILL_TO_ADDRESS1>103616</BILL_TO_ADDRESS1>
      <SHIP_TO_COUNTRY>US</SHIP_TO_COUNTRY>
      <SHIP_TO_POSTAL_CODE>19601</SHIP_TO_POSTAL_CODE>
      <SHIP_TO_CITY>Reading</SHIP_TO_CITY>
      <SHIP_TO_REGION>US</SHIP_TO_REGION>
      <SHIP_TO_ADDRESS3>Reading</SHIP_TO_ADDRESS3>
      <SHIP_TO_ADDRESS2>419 Douglass St</SHIP_TO_ADDRESS2>
      <SHIP_TO_ADDRESS1>103616</SHIP_TO_ADDRESS1>
      <BUSINESS_GROUP>SunPower Systems Sarl (SPSW OU)</BUSINESS_GROUP>
      <SHIP_TO_CONTACT_PHONE>5198223089</SHIP_TO_CONTACT_PHONE>
      <SHIPPING_INSTRUCTIONS>None</SHIPPING_INSTRUCTIONS>
      <FOB_CODE>Port of Destination</FOB_CODE>
      <SHIP_TO_CONTACT_NAME>SOLARDELPHIA</SHIP_TO_CONTACT_NAME>
      <SOURCE_WAREHOUSE>C21</SOURCE_WAREHOUSE>
      <DESTINATION_WAREHOUSE_CODE>W03</DESTINATION_WAREHOUSE_CODE>
      <SCAC_CODE>RYDR</SCAC_CODE>
      <ACTUAL_SHIP_DATE>42167</ACTUAL_SHIP_DATE>
      <SCHEDULED_ARRIVAL_DATE>42168</SCHEDULED_ARRIVAL_DATE>
      <FREIGHT_TERMS_CODE>DDP</FREIGHT_TERMS_CODE>
      <WAYBILL>1022133</WAYBILL>
      <LOAD_NUMBER>876628923</LOAD_NUMBER>
      <TRACKING_NUMBER>TX9823</TRACKING_NUMBER>
      <ATTRIBUTE1/>
      <ATTRIBUTE2/>
      <ATTRIBUTE3/>
      <ATTRIBUTE4/>
      <ATTRIBUTE5/>
      <FILE_NAME>DEL_US_RYDER.xml</FILE_NAME>
      <DESTINATION_PROJECT_NAME>Solar Star</DESTINATION_PROJECT_NAME>
      <DESTINATION_PROJECT_NUMBER>123322</DESTINATION_PROJECT_NUMBER>
      <SHIPPING_MODE>TL</SHIPPING_MODE>
      <SERVICE_LEVEL>Standard</SERVICE_LEVEL>
      <LICENCE_PLATES>
         <LICENCE_PLATE>
            <LPN_NUMBER>LPN03</LPN_NUMBER>
            <PACK_TYPE>Pallet</PACK_TYPE>
            <WEIGHT>10</WEIGHT>
            <HEIGHT>1</HEIGHT>
            <LENGTH>1</LENGTH>
            <WIDTH>1</WIDTH>
            <WEIGHT_UOM>LBS</WEIGHT_UOM>
            <LINEAR_UOM>IN</LINEAR_UOM>
            <TRACKING_NUMBER>TN1023</TRACKING_NUMBER>
            <ATTRIBUTE1/>
            <ATTRIBUTE2/>
            <ATTRIBUTE3/>
            <ATTRIBUTE4/>
            <ATTRIBUTE5/>
            <LINE_ITEMS>
               <LINE_ITEM>
                  <LINE_ID_REFERENCE>129441</LINE_ID_REFERENCE>
                  <SHIPPED_ITEM>509665</SHIPPED_ITEM>
                  <SHIPPED_ITEM_DESCRIPTION>PVM, SPR-E20-435-COM, 4 PV4 1KV</SHIPPED_ITEM_DESCRIPTION>
                  <SHIPPED_QUANTITY>4</SHIPPED_QUANTITY>
                  <SHIPPED_QTY_UOM>EA</SHIPPED_QTY_UOM>
                  <SOURCE_SUBINVENTORY>1403</SOURCE_SUBINVENTORY>
                  <SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>33</SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>
                  <PACKING_INSTRUCTIONS>Packed</PACKING_INSTRUCTIONS>
                  <CUSTOMER_PO_NUMBER>PO-837232</CUSTOMER_PO_NUMBER>
                  <SALES_ORDER_NUMBER>12332851</SALES_ORDER_NUMBER>
                  <SALES_ORDER_LINE_NUMBER>1</SALES_ORDER_LINE_NUMBER>
                  <INTERNAL_REQUISITION_NUMBER>987823725</INTERNAL_REQUISITION_NUMBER>
                  <INTERNAL_REQ_LINE_NUMBER>1</INTERNAL_REQ_LINE_NUMBER>
                  <ATTRIBUTE1/>
                  <ATTRIBUTE2/>
                  <ATTRIBUTE3/>
                  <ATTRIBUTE4/>
                  <ATTRIBUTE5/>
                  <SERIAL_LINE_ITEMS/>
               </LINE_ITEM>
            </LINE_ITEMS>
         </LICENCE_PLATE>
         <LICENCE_PLATE>
            <LPN_NUMBER>LPN04</LPN_NUMBER>
            <PACK_TYPE>Box</PACK_TYPE>
            <WEIGHT>1</WEIGHT>
            <HEIGHT>1</HEIGHT>
            <LENGTH>1</LENGTH>
            <WIDTH>1</WIDTH>
            <WEIGHT_UOM>LBS</WEIGHT_UOM>
            <LINEAR_UOM>IN</LINEAR_UOM>
            <TRACKING_NUMBER>TN1023</TRACKING_NUMBER>
            <ATTRIBUTE1/>
            <ATTRIBUTE2/>
            <ATTRIBUTE3/>
            <ATTRIBUTE4/>
            <ATTRIBUTE5/>
            <LINE_ITEMS>
               <LINE_ITEM>
                  <LINE_ID_REFERENCE>129441</LINE_ID_REFERENCE>
                  <SHIPPED_ITEM>509665</SHIPPED_ITEM>
                  <SHIPPED_ITEM_DESCRIPTION>PVM, SPR-E20-435-COM, 4 PV4 1KV</SHIPPED_ITEM_DESCRIPTION>
                  <SHIPPED_QUANTITY>4</SHIPPED_QUANTITY>
                  <SHIPPED_QTY_UOM>EA</SHIPPED_QTY_UOM>
                  <SOURCE_SUBINVENTORY>1403</SOURCE_SUBINVENTORY>
                  <SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>33</SOURCE_SUBINVENTORY_ADDITIONAL_REFERENCE>
                  <PACKING_INSTRUCTIONS>Packed</PACKING_INSTRUCTIONS>
                  <CUSTOMER_PO_NUMBER>PO-837232</CUSTOMER_PO_NUMBER>
                  <SALES_ORDER_NUMBER>12332851</SALES_ORDER_NUMBER>
                  <SALES_ORDER_LINE_NUMBER>1</SALES_ORDER_LINE_NUMBER>
                  <INTERNAL_REQUISITION_NUMBER>987823725</INTERNAL_REQUISITION_NUMBER>
                  <INTERNAL_REQ_LINE_NUMBER>1</INTERNAL_REQ_LINE_NUMBER>
                  <ATTRIBUTE1/>
                  <ATTRIBUTE2/>
                  <ATTRIBUTE3/>
                  <ATTRIBUTE4/>
                  <ATTRIBUTE5/>
                  <SERIAL_LINE_ITEMS/>
               </LINE_ITEM>
            </LINE_ITEMS>
         </LICENCE_PLATE>
      </LICENCE_PLATES>
   </HEADER>
</type>
;

declare option saxon:output "indent=yes";

(:
declare function local:prepareWSInput($gdataAccessResponse,$gConfiguration)
{
 
      let $header_mapping :=$gConfiguration/Edicom[@resource='940']/data-mapping/table[@name='header']
      let $line_item_mapping :=$gConfiguration/Edicom[@resource='940']/data-mapping/table[@name='line_item']
      return
             <HEADERS>
              
                {
                  for $eachControlNumber in distinct-values($gdataAccessResponse/das:row//CONTROL_NUMBER)
                   return
                    <HEADER>
                      {
                       for $parameter in $header_mapping/column
                           let $source:=data($parameter/@source)
                           let $target :=data($parameter/@target)
                           let $value :=distinct-values($gdataAccessResponse/das:row[CONTROL_NUMBER/text()=$eachControlNumber]/saxon:evaluate($source)/text())
                       return     
                           element {$target} {$value}
                      }
                      {
                       <LINE_ITEMS>
                         {
                          for $line_item in $gdataAccessResponse/das:row[CONTROL_NUMBER/text()=$eachControlNumber]
                           return 
                            <LINE_ITEM>
                             { 
                               for $parameter in $line_item_mapping/column
                                   let $source:=data($parameter/@source)
                                   let $target :=data($parameter/@target)
                                   let $value :=$line_item/saxon:evaluate($source)/text()
                               return     
                                    element {$target} {$value}}
                            </LINE_ITEM>
                         }
                       </LINE_ITEMS>       
                      }  
                   </HEADER>
                }    
             </HEADERS>
};:)

declare function local:prepareDASRequestfor945($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName)
{
  <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ:prepareHeaderSQLFor945($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName)
     }
     { 
    
      let $license_plates :=   for $license_plate_counter in 1 to count($gHeader/LICENCE_PLATES/LICENCE_PLATE)                    
         return   ediQ:prepareLicensePlateSQLFor945($configuration,$gHeader/LICENCE_PLATES/LICENCE_PLATE[$license_plate_counter],$gHeaderId,$gProcessId,$license_plate_counter)/*
      return  $license_plates      
    }
</das:multiDataAccessRequest>
  
};
 
 declare function local:prepareWSRequestForEdicom940()
 {
  ediQ:prepareWSInputFor940($gdataAccessResponse,$gConfiguration)
 };
 
ediQ:prepareDASRequestForEdicom945( $gConfiguration,$gHeader//HEADER[1],123345,'123','test.xml')