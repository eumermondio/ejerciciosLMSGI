<superheroes> {
avg(for $super in doc('superheroes.xml')/marvel/superheroe
let $lvl := $super/@nivel
where $super/@nivel = $lvl
return $lvl)
} </superheroes>