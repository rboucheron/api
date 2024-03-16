#!/bin/sh 

echo "what entity does this controller refer to? "
read ENTITY 
attributs=()
if [ -f "./models/$ENTITY.txt" ]; then
    while read ENTREE
    do
    attributs+=("$ENTREE")
    done < "./models/$ENTITY.txt" 
    cd "./src/Controller"
    CONTROLLER="${ENTITY}Controller"
    touch "$CONTROLLER.php"
    echo "<?php" >> "$CONTROLLER.php"
    echo "include('./src/entity/$ENTITY.php');" >> "$CONTROLLER.php"
    echo "class $CONTROLLER" >> "$CONTROLLER.php"
    echo "{" >> "$CONTROLLER.php"

    echo "public function getAll() {" >> "$CONTROLLER.php"
    echo "\$$ENTITY = new $ENTITY;" >> "$CONTROLLER.php"
    echo "return json_encode( \$$ENTITY->gets());" >> "$CONTROLLER.php"
    echo "}" >> "$CONTROLLER.php"

    echo "public function get(\$id) {" >> "$CONTROLLER.php"
    echo "\$$ENTITY = new $ENTITY;" >> "$CONTROLLER.php"
    echo "\$$ENTITY->set_id(\$id);" >> "$CONTROLLER.php"
    echo "return json_encode( \$$ENTITY->get());" >> "$CONTROLLER.php"
    echo "}" >> "$CONTROLLER.php"

    echo "public function delete(\$id) {" >> "$CONTROLLER.php"
    echo "\$$ENTITY = new $ENTITY;" >> "$CONTROLLER.php"
    echo "\$$ENTITY->set_id(\$id);" >> "$CONTROLLER.php"
    echo "\$$ENTITY->remove();" >> "$CONTROLLER.php"
    echo "}" >> "$CONTROLLER.php"


    echo "public function post(\$data) {" >> "$CONTROLLER.php"
    echo "\$$ENTITY = new $ENTITY;" >> "$CONTROLLER.php"
    for attribut in "${attributs[@]}"
    do
    echo "\$$ENTITY->set_${attribut}(\$data['${attribut}']);" >> "$CONTROLLER.php"
    done
    echo "\$$ENTITY->post();" >> "$CONTROLLER.php"
    echo "}" >> "$CONTROLLER.php"

    
    echo "public function update(\$id, \$data) {" >> "$CONTROLLER.php"
    echo "\$$ENTITY = new $ENTITY;" >> "$CONTROLLER.php"
    echo "\$$ENTITY->set_id(\$id);" >> "$CONTROLLER.php"
    for attribut in "${attributs[@]}"
    do
    echo "\$$ENTITY->set_${attribut}(\$data['${attribut}']);" >> "$CONTROLLER.php"
    done
    echo "\$$ENTITY->update();" >> "$CONTROLLER.php"
    echo "}" >> "$CONTROLLER.php"

    echo "}" >> "$CONTROLLER.php"


else
    echo "$ENTITY not found"
fi
