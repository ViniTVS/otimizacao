
mkdir -p outputs

for filename in exemplos/*; do
    dir=$(eval "basename $filename .in")

    mkdir -p outputs/$dir

    for k in {1..5}; do
        python3 elenco < $filename &> outputs/$dir/no_flags-$k.out

        python3 elenco -a < $filename &> outputs/$dir/a-$k.out
        python3 elenco -f < $filename &> outputs/$dir/f-$k.out
        python3 elenco -o < $filename &> outputs/$dir/o-$k.out

        python3 elenco -a -f < $filename &> outputs/$dir/af-$k.out
        # python3 elenco -a -o < $filename &> outputs/$dir/ao-$k.out
        python3 elenco -o -f < $filename &> outputs/$dir/of-$k.out

        # python3 -a -o -f elenco < $filename &> outputs/$dir/all_flags-$k.out

    done

done