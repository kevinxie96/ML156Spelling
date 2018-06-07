def train_model():
    stop_increment = 3
    min_increment = 0
    test_batch_amount = 100 or a high enough amount to check 
                        that we have reached a local min
    for each epoch:
        for each batch:
            calculate the batch loss/error by running the batch
            using Tensorflow with nodes contained in the graph
            returned by build_model()
            if we have reached a 
                if we have reached a new minimum:
                    min_increment = 0
                else if there is no improvement:
                    min_increment = 1
                    if min_increment == stop_increment:
                        break
        if min_increment == stop_increment:
            save the model in disk as a checkpoint
            return
