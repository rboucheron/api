#!/bin/sh

echo "Name of the new entity:"
read NAME 

attributs=()
cd ./src/Entity
touch "$NAME.php"
echo "<?php" >> "$NAME.php"
echo "class $NAME extends Model {" >> "$NAME.php"
echo "  private \$id;" >> "$NAME.php"

while [ "$ENTREE" != "bye" ]
do
  echo "Add a new attribute to $NAME (type 'bye' to finish)"
  read ENTREE
  if [ "$ENTREE" != "bye" ]; then
    attributs+=("$ENTREE")
    echo "  private \$$ENTREE;" >> "$NAME.php"
  fi
done

echo "  public function __construct() {" >> "$NAME.php"
echo "    \$this->table = __CLASS__;" >> "$NAME.php"
echo "    parent::__construct();" >> "$NAME.php"
echo "  }" >> "$NAME.php"

echo "  public function set_id(\$id) {" >> "$NAME.php"
echo "    \$this->id = \$id;" >> "$NAME.php"
echo "  }" >> "$NAME.php"

echo "  public function get_id() {" >> "$NAME.php"
echo "    return \$this->id;" >> "$NAME.php"
echo "  }" >> "$NAME.php"

for attribut in "${attributs[@]}"
do
  echo "  public function set_${attribut}(\$$attribut) {" >> "$NAME.php"
  echo "    \$this->$attribut = \$$attribut;" >> "$NAME.php"
  echo "  }" >> "$NAME.php"
  echo "  public function get_${attribut}() {" >> "$NAME.php"
  echo "    return \$this->$attribut;" >> "$NAME.php"
  echo "  }" >> "$NAME.php"
done

echo "  public function gets() {" >> "$NAME.php"
echo "    return \$this->findall();" >> "$NAME.php"
echo "  }" >> "$NAME.php"

echo "  public function get() {" >> "$NAME.php"
echo "    return \$this->find('id', \$this->id);" >> "$NAME.php"
echo "  }" >> "$NAME.php"

echo "  public function remove() {" >> "$NAME.php"
echo "    return \$this->delete(\$this->id);" >> "$NAME.php"
echo "  }" >> "$NAME.php"


echo "  public function post() {" >> "$NAME.php"
echo "  \$data = array(" >> "$NAME.php"
for attribut in "${attributs[@]}"
do
  echo "  '$attribut' => \$this->get_${attribut}()," >> "$NAME.php"
done
echo ");" >> "$NAME.php"
echo "\$this->insert(\$data);" >> "$NAME.php"
echo "}" >> "$NAME.php"


echo "  public function update() {" >> "$NAME.php"
echo "  \$data = array(" >> "$NAME.php"
for attribut in "${attributs[@]}"
do
  echo "  '$attribut' => \$this->get_${attribut}()," >> "$NAME.php"
done
echo ");" >> "$NAME.php"
echo "\$this->put(\$this->id, \$data);" >> "$NAME.php"
echo "}" >> "$NAME.php"

echo "}" >> "$NAME.php"

cd "../../models"
touch "$NAME.txt"

for attribut in "${attributs[@]}"
do

  echo "$attribut" >> "$NAME.txt"

done






echo "The $NAME entity was successfully created"
