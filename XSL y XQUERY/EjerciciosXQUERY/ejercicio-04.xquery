<superheroes> {
for $super in doc('superheroes.xml')/marvel/superheroe
where contains(upper-case(($super/@poderes)), upper-case('fuerza')) and contains(($super/@amigos), 'Iron Man')
return <superheroe>{ data($super/@nombre) }</superheroe>
} </superheroes>