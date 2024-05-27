<%-- 
                            ESTO CREO QUE SI ES PA TODOS
    3. Historial de tutorias realizadas (Fecha, duracion y temas tratados)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head><title>DISEÑO UV</title>
        <meta charset="utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge" /><meta name="viewport" content="width=device-width, initial-scale=1" /><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,400italic,600" rel="stylesheet" type="text/css" />

        
    </head>
    <body>

        <form method="post" action="./avance" id="form1">
            <div class="aspNetHidden">
                <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="WWW0IdxGq8U95GVL06EYpB5l6ePGp9Rm8kz2tRuczzNp0k07bqkHkVhmpFxANvRyoDZ87uAbB6eVnyHzcsG5/dnmC5KYcfEgModTT3lsxzhw/lV1VZfk0fSyi6vn+VM/87H/U4x7+4PAvlr9qgGpCV0mAYQirc/ApvD7eeQpura2f3lgCfJNu3lDj4fd7AzOiGWwpnbyGYhaQvqjmaB+0Opi/u1t0kSjFcxq8mPYrz4AkUbTjHljp1hIC+zGG4IzMgiack2IX4X3rmuZFIVUAFkSdZLE6sC0md6Q7zO0/fjGzx0bHr999PnBw/WOclULIEA6SmEMhOTrkorWSI9GEigq9G8Az+DdNuUqJXhxWCShw1w3203qMbufOLlvu+TVCh99K2HYVnAOKu3uULXm+gLTUC3QM7qHkAXRjEd88JO9NALvZHMyrxRR6UEritc/hhuj0ogDpOG2OvjA/q1uxlCTORxutb4CGfKoOmgrEWg=" />
            </div>

            <div class="aspNetHidden">

                <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="6D8ED794" />
            </div>
            <div class="contenedor-iavance">

                <iframe src="https://dsiapes.uv.mx/MiUVTrayectoria/default.aspx?p=CtAxhhHsH/Sg7VGI7avuAQhmlTUvwBVtui/cL7rHnHM=" id="contenido_i_avance" scrolling="yes" class="iavance"></iframe> 
                <div id="divEspere" class="modal fadeIn" role="dialog" style="display:initial">
                    <div class="modal-dialog">
                        <div class="col-md-12" style="text-align: center; padding-top: 30px;">
                            <div class="loader-inner ball-scale-multiple">
                                <div></div>
                                <div></div>
                                <div></div>
                            </div>
                        </div>
                        <div class="col-md-12" style="text-align: center;">
                            <h3 style="text-align: center; padding-top: 30px; font-weight: bold; color: #FFF !important; font-size: 16px;" class="mensaje-modal">Espere...</h3>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>