#!/bin/bash

do_set_vars_on_centos(){

   # add any Suse Linux specific vars settings here
   export host_name="$(hostname | cut -d'.' -f1)
}
