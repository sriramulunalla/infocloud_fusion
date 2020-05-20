module namespace ediQ_SOA='http://www.sunpower.com/middleware/realtime/edicom_soa/xquery/1.0';
import module namespace functx = "http://www.common.functx.com" at "../../Edicom_Common/xquery/functx-xquery-functions.xq";

declare namespace das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd";

 
 declare function ediQ_SOA:prepareDASRequestForEdicom997 ($configuration as node(),$gEDI997XML as node(),$gFileName as xs:string?)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ_SOA:prepareHeaderSQLFor997($configuration,$gEDI997XML,$gFileName)
     }
</das:multiDataAccessRequest>
};


declare function ediQ_SOA:prepareHeaderSQLFor997($configuration,$gEDI997XML,$gFileName)
{
 let $baseSql :=$configuration/Edicom[@resource='997']/data-mapping/table[@name='header']/sql-statement/text()
 let $columnNameSequence :=for $element in $gEDI997XML/row/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='997']/data-mapping/table[@name='header']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gFileName')
 let $toSql :=   ($columnNames,$values,$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom997-Header">
          <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='997']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='997']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gEDI997XML/row/saxon:evaluate($source)   
                    where exists( $element/text())
                return    
                if ($dataType = 'date') then 
                <das:parameter sqlType="{$dataType}">{concat(substring($element/text(),7,4),
                                                                '-',
                                                             substring($element/text(),4,2),
                                                                '-',
                                                             substring($element/text(),1,2),
                                                                'T',
                                                             substring-after($element/text(),' '),
                                                                ':00')}
                 </das:parameter>
                 
                else 
                    <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
                    
              }
    </das:sqlStatement>
  
};

(: ---------------------- This section is for EDI 214 mappings----------------------------------------- :)

 declare function ediQ_SOA:prepareDASRequestForEdicom214 ($configuration as node(),$gEDI214XML as node(),$gFileName as xs:string?)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ_SOA:prepareHeaderSQLFor214($configuration,$gEDI214XML,$gFileName)
     }
</das:multiDataAccessRequest>
};

 declare function ediQ_SOA:prepareHeaderSQLFor214($configuration,$gEDI214XML,$gFileName)
{
 let $baseSql :=$configuration/Edicom[@resource='214']/data-mapping/table[@name='header']/sql-statement/text()
 
 let $columnNameSequence :=for $element in $gEDI214XML/row/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='214']/data-mapping/table[@name='header']/column[@source=$elementName]/@target) 
        let $toDB :=data($configuration/Edicom[@resource='214']/data-mapping/table[@name='header']/column[@source=$elementName]/@toDB)        
        where exists( $element/text()) and $target !='' and $toDB = 'Y'
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gFileName')
 let $toSql :=   ($columnNames,$values,$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom214-Header">
          <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='214']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='214']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gEDI214XML/row/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
    </das:sqlStatement>
  
};

(: ---------------------- This section is for EDI 846 mappings----------------------------------------- :)

declare function ediQ_SOA:prepareDASRequestForEdicom846 ($configuration as node(),$gPayload as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gFileName as xs:string)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ_SOA:prepareHeaderSQLFor846($configuration,$gPayload,$gHeaderId,$gProcessId,$gFileName)
     }
     
     
     { 
        
        let $lines :=   for $line at $pos in $gPayload/lines                    
                                return
                           ediQ_SOA:prepareLineItemSQLFor846($configuration,$gPayload/lines[$pos],$gHeaderId,$gProcessId)
        return $lines
         
    }
     
</das:multiDataAccessRequest>


};


declare function ediQ_SOA:prepareHeaderSQLFor846($configuration,$gPayload,$gHeaderId,$gProcessId,$gFileName) 
{
 let $baseSql :=$configuration/Edicom[@resource='846']/data-mapping/table[@name='header']/sql-statement/text()
 let $columnNameSequence :=for $element in $gPayload/header/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='header']/column[@source=$elementName]/@target)
        let $toDB :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='header']/column[@source=$elementName]/@toDB)       
        where exists( $element/text()) and $target !='' and $toDB = 'Y'
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gFileName')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
            <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom846-Header">
          <das:statement>{$sqlStatement}</das:statement>
               {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gPayload/header/saxon:evaluate($source)
                    where exists( $element/text())
                return  
          
                if ($dataType = 'date') then 
                <das:parameter sqlType="{$dataType}">{concat(substring($element/text(),1,4),
                                                                '-',
                                                             substring($element/text(),5,2),
                                                                '-',
                                                             substring($element/text(),7,2),
                                                                'T',
                                                             substring($element/text(),9,2),
                                                                  ':',
                                                             substring($element/text(),11,2),
                                                              ':',
                                                             substring($element/text(),13,2)
                                                               )}
                 </das:parameter>
                 
                else  
                 
                    <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
    </das:sqlStatement>

};

declare function ediQ_SOA:prepareLineItemSQLFor846($configuration,$gPayload,$gHeaderId,$gProcessId) 
{
 let $baseSql :=$configuration/Edicom[@resource='846']/data-mapping/table[@name='line']/sql-statement/text()
 let $columnNameSequence :=for $element in $gPayload/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='line']/column[@source=$elementName]/@target)
        let $toDB :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='line']/column[@source=$elementName]/@toDB)       
        where exists( $element/text()) and $target !='' and $toDB = 'Y'
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom846-LineItem">
                    <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='line']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='846']/data-mapping/table[@name='line']/column[@target=$column]/@dataType)                      
                    let $element :=   $gPayload/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
              </das:sqlStatement>                
            
      
  
};

(: ---------------------- This section is for EDI_OUTBOUND 861 mappings----------------------------------------- :)

declare function ediQ_SOA:prepareDASRequestForEdicom861 ($configuration as node(),$gPayload as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gFileName as xs:string)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ_SOA:prepareHeaderSQLFor861($configuration,$gPayload,$gHeaderId,$gProcessId,$gFileName)
     }
     
     
     { 
        
        let $lines :=   for $line at $pos in $gPayload/lines                    
                                return
                           ediQ_SOA:prepareLineItemSQLFor861($configuration,$gPayload/lines[$pos],$gHeaderId,$gProcessId)
        return $lines
         
    }
     
</das:multiDataAccessRequest>


};


declare function ediQ_SOA:prepareHeaderSQLFor861($configuration,$gPayload,$gHeaderId,$gProcessId,$gFileName) 
{
 let $baseSql :=$configuration/Edicom[@resource='861']/data-mapping/table[@name='header']/sql-statement/text()
 let $columnNameSequence :=for $element in $gPayload/header/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='header']/column[@source=$elementName]/@target)
        let $toDB :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='header']/column[@source=$elementName]/@toDB)       
        where exists( $element/text()) and $target !='' and $toDB = 'Y'
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gFileName')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
            <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom861-Header">
          <das:statement>{$sqlStatement}</das:statement>
               {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gPayload/header/saxon:evaluate($source)
                    where exists( $element/text())
                return  
          
                if ($dataType = 'date') then 
                <das:parameter sqlType="{$dataType}">{concat(substring($element/text(),1,4),
                                                                '-',
                                                             substring($element/text(),5,2),
                                                                '-',
                                                             substring($element/text(),7,2),
                                                                'T',
                                                             substring-after($element/text(),' '),
                                                                ':00')}
                 </das:parameter>
                 
                else  
                 
                    <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
    </das:sqlStatement>

};

declare function ediQ_SOA:prepareLineItemSQLFor861($configuration,$gPayload,$gHeaderId,$gProcessId) 
{
 let $baseSql :=$configuration/Edicom[@resource='861']/data-mapping/table[@name='line']/sql-statement/text()
 let $columnNameSequence :=for $element in $gPayload/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='line']/column[@source=$elementName]/@target)
        let $toDB :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='line']/column[@source=$elementName]/@toDB)       
        where exists( $element/text()) and $target !='' and $toDB = 'Y'
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom861-LineItem">
                    <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='line']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='861']/data-mapping/table[@name='line']/column[@target=$column]/@dataType)                      
                    let $element :=   $gPayload/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
              </das:sqlStatement>                
            
      
  
};


(: ---------------------- This section is for EDI_OUTBOUND 888 mappings----------------------------------------- :)

declare function ediQ_SOA:prepareWSInputFor888($EdiOracleResp as node(),$gConfiguration as node(),$edicomRegion as xs:string)
{
 
      let $header_mapping :=$gConfiguration/Edicom[@resource='888']/data-mapping/table[@name='header']
          return
             <HEADERS>
              
                {
                  for $eachRow in $EdiOracleResp/das:row
                   return
                    <HEADER>
                    <REGION>{$edicomRegion}</REGION>
                      {                      
                       for $parameter in $header_mapping/column
                           let $source:=data($parameter/@source)
                           let $target :=data($parameter/@target)
                           let $value := $eachRow/saxon:evaluate($source)/text()
                       return     
                           element {$target} {$value}
                      }
                     
                   </HEADER>
                }    
             </HEADERS>
};

(: ---------------------- This section is for EDI_OUTBOUND 204 mappings----------------------------------------- :)

declare function ediQ_SOA:prepareWSInputFor204($gDataAccessResponse as node(),$gConfiguration as node())
{
 
      let $header_mapping :=$gConfiguration/Edicom[@resource='204']/data-mapping/table[@name='header']
          return
             <HEADERS>
              
                {
                  for $eachRow in $gDataAccessResponse/das:row
                   return
                    <HEADER>
                      {                      
                       for $parameter in $header_mapping/column
                           let $source:=data($parameter/@source)
                           let $target :=data($parameter/@target)
                           let $value := $eachRow/saxon:evaluate($source)/text()
                       return     
                           element {$target} {$value}
                      }
                     
                   </HEADER>
                }    
             </HEADERS>
};

(: ---------------------- This section is for EDI_OUTBOUND 856 mappings----------------------------------------- :)

declare function ediQ_SOA:prepareWSInputFor856($gDataAccessResponse as node(),$gConfiguration as node())
{
 
      let $header_mapping :=$gConfiguration/Edicom[@resource='856']/data-mapping/table[@name='header']
          return
             <HEADERS>
              
                {
                  for $eachRow in $gDataAccessResponse/das:row
                   return
                    <HEADER>
                      {                      
                       for $parameter in $header_mapping/column
                           let $source:=data($parameter/@source)
                           let $target :=data($parameter/@target)
                           let $value := $eachRow/saxon:evaluate($source)/text()
                       return     
                           element {$target} {$value}
                      }
                     
                   </HEADER>
                }    
             </HEADERS>
};