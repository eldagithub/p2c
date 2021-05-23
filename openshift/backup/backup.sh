mkdir save
cd save
for object in $(oc api-resources --namespaced=true -o name)
do
  oc get -o yaml  $object > $object.yaml
done
