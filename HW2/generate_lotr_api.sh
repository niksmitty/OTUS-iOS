MODULE="Modules/LotRAPI/Sources/LotRAPI"

openapi-generator generate -i "lotr_api.yml" -g swift5 -o "lotr_api"
rm -r $MODULE""*
cp -R "lotr_api/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "lotr_api"