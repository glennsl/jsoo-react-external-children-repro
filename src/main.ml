open React.Dom.Dsl
open Html
module Js = Js_of_ocaml.Js

external%component map : children:React.element Js.js_array Js.t -> React.element
  = {|require("react-leaflet").MapContainer|}

external%component tile_layer : attribution:Js.js_string Js.t -> url:Js.js_string Js.t -> React.element
  = {|require("react-leaflet").TileLayer|}

let%component make () =
  div [||]
    [ map ~children:(Js.array [|
                         tile_layer ~attribution:(Js.string "") ~url:(Js.string "") ()
                       |])
        ()
    ]
