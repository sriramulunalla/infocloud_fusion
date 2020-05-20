<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<csv_data>
	
			<xsl:for-each select="type/HEADER">				
			<xsl:value-of select="concat(Invoice_No,',',PackSlip_Number,',',Document_Date,',',OU_Name,',',Ship_Address1,',',Ship_Address2,',',Ship_Address3,',',Ship_City,',',Ship_Region,',',Ship_PostalCode,',',Ship_from_Country,',',PortOfLoading,',',SHIP_TO_CUSTOMER_NAME,',',Ship_to_Address1,',',Ship_to_Address2,',',Ship_to_Address3,',',Ship_to_City,',',Ship_to_Region,',',Ship_to_Postal_Code,',',Ship_to_Country,',',PortOfDischarge,',',DateOfDeparture,',',Ship_Region,',',Ship_PostalCode,',',Ship_from_Country,',',SHIP_TO_CUSTOMER_NAME,',',Ship_to_Address1,',',Ship_to_Address2,',',Ship_to_Address3,',',Ship_to_City,',',Ship_to_Region,',',Ship_to_Postal_Code,',',Ship_to_Country,',',PortOfDischarge,',',DateOfDeparture,',',DateOfArrival_Port,',',Destination_Warehouse,',',Forwarder,',',ShipMethodCode,',',Waybill,',',Shipping_Instructions,',',Item_Number,',',Item_Description,',',Shipped_Qty,',',Req_UOM,',',Unit_Price,',',Total_Amount,',',Blank_One,',',Blank_Two,',',Pallet_No,',',Container,',',Seal_Number,',',Shipment_Date,',',DateOfArrival_Site,',',Internal_Request_Number,',',Source_Warehouse,',',Source_Warehouse, Source_Project_ID,',',Source_Project_Name,',',Destination_Project_ID,',',Destination_Project_Name,',',Business_Group,',',ShipFromAddress_ID,',',ShipToAddress_ID,',',BillToAddressID,',',From_Subinventory,',',From_Locator,',',To_Subinventory,',',To_Locator,',',Serial_Number,',',Blank_Three,',',Blank_Four,
		'&#xA;')" />
			</xsl:for-each>
		</csv_data>
	</xsl:template>
</xsl:stylesheet>