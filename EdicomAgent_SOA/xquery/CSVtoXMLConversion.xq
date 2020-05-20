(: XQuery main module :)
module namespace csvtoxml='http://www.sunpower.com/middleware/realtime/sunpower/agent/csvtoxml/xquery/1.0';                           
import module namespace functx = "http://www.common.functx.com" at "../../Edicom_Common/xquery/functx-xquery-functions.xq";

(: XQuery adaptation of https://github.com/digital-preservation/csv-tools/blob/master/csv-to-xml_v3.xsl.
   See also the thread on basex-talk https://mailman.uni-konstanz.de/pipermail/basex-talk/2016-September/011272.html.
:)

 declare function csvtoxml:convert997CSVtoXML($gEdicomCSV as node(),$element as node()){ 
let $lines := tokenize($gEdicomCSV, '\n')
let $head := tokenize($lines[1], ',')
let $data := remove($lines, 1)
return
    element {local-name($element)}
        {
            for $line in $data
            let $fields := tokenize($line, ',')
            return
                <row>
                    {
                        for $key at $pos in $head
                        let $value := $fields[$pos]
                        return
                            element { translate($key,'"','') } { translate($value,'"','') }
                    }
                </row>
        }
   
 };
 
 declare function csvtoxml:convert214CSVtoXML($gEdicomCSV as node(),$element as node(),$gconfiguration as node())
 { 
let $lines := tokenize($gEdicomCSV, '\n')
let $head := tokenize($lines[1], ',')
let $data := remove($lines, 1)

let $header_elements :=data($gconfiguration/Edicom[@resource='214']/data-mapping/table[@name='header']/column[@fromFile='Y']/@source)

return
    element {local-name($element)}
        {
            for $lines in $data
            let $fields := tokenize($lines, ',')
            return
                <row>
                    {
                        for $key at $pos in $header_elements
                        let $value := $fields[$pos]
                        return
                            element { translate(translate($key,'"',''),' ','_') } { translate($value,'"','') }
                    }
                </row>
        }
   
 };
 
 
 
 declare function csvtoxml:convert861CSVtoXML($gEdicomCSV as node(),$element as node(),$gconfiguration as node())
 { 
let $lines := tokenize($gEdicomCSV, '\n')
let $head := tokenize($lines[1], ',')
let $line := tokenize($lines[2], ',')
let $no_header := remove($lines, 1)
let $data := remove($no_header, 1) 
let $lineCounter := 0

let $header_elements :=data($gconfiguration/Edicom[@resource='861']/data-mapping/table[@name='header']/column[@fromFile='Y']/@source)
let $line_elements :=data($gconfiguration/Edicom[@resource='861']/data-mapping/table[@name='line']/column[@fromFile='Y']/@source)

return
    element {local-name($element)}
        {
            for $record in $data
            let $fields := tokenize($record, ',')
            return
                
              if(starts-with($fields[1],'"H"')) then 
               
                    <header>
                        {
                            for $key at $pos in $header_elements
                            let $value := $fields[$pos]                         
                            return
                                element { translate($key,'"','') } { translate($value,'"','') }
                               
                        }
                    </header>
                else
                    <line>
                        {
                            for $key at $pos in $line_elements
                            let $value := $fields[$pos]
                           
                            return
                            
                                if(starts-with($key,'"L"' ))then
                                    element { translate($key,'"','') } { $lineCounter }
                                else
                                    element { translate($key,'"','') } { translate($value,'"','') }
                            
                        }
                    </line>
                
        }
   
 };  
 
declare function csvtoxml:convert846CSVtoXML($gEdicomCSV as node(),$element as node(), $gconfiguration as node() )                 
{ 
(:let $lines := tokenize($gEdicomCSV, '\n'):)
let $lines := tokenize($gEdicomCSV, '&#xD;')
let $line_data := remove($lines, count($lines))
let $header_elements :=data($gconfiguration/Edicom[@resource='846']/data-mapping/table[@name='header']/column[@fromFile='Y']/@source)
let $line_elements :=data($gconfiguration/Edicom[@resource='846']/data-mapping/table[@name='line']/column[@fromFile='Y']/@source)
return
    element {local-name($element)}   
            
        
        {            
            for $record at $record_pos in $line_data
            let $fields := tokenize($record, '\|')            
            return
               if($fields[1] = 'H') then 
               
                    <header>
                        {
                            for $key at $pos in $header_elements
                            let $value := $fields[$pos]                         
                            return
                                element { translate($key,'"','') } { translate($value, '"', '') }
                               
                        }
                    </header>
                else
                    
                
                    <lines>
                        {
                            for $key at $pos in $line_elements
                            let $value := $fields[$pos]
                           
                            return
                            
                                if($pos = 1)then
                                    element { translate($key,'"','') } { ($record_pos)-1 }                                    
                                    
                                else
                                    element { translate($key,'"','') } { translate($value,'"','') }
                            
                        }
                    </lines>
                
        }
   
 };  




