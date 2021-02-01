Plotting a graph
> input <- scan(file="HIV1_10_50_100", what=list(pos=0, x=0, y=0, z=0), flush=TRUE)
Read 12314 records

#Find the max of the three columns x, y, z plot y-axis
> max_y <- max(input$x, input$y, input$z) 
#Find the max of positions to plot the x-axis
> max_x <- max(input$pos) 
#Decide the plot colors needed
> plot_colors <- c("red", "green", "blue") 

#Start the PNG device
> png(filename="HIV1_10_50_100.png", height=1000, width=1000, bg="white") 

#Plot the first series
> plot(input$x, type="o", col=plot_colors[1], ylim=c(0, max_y+4), axes=F, ann=F)
> axis(1, at=1:max_x+10, lab=input$pos) # x-axis
> axis(2, las=1, at=100*0:max_y+4) # y-axis
> box() # draw the box around the graph

# second series
> lines(input$y, type="o", pch=22, lty=2, col=plot_colors[2]) 
# third series
> lines(input$z, type="o", pch=23, lty=3, col=plot_colors[3]) 

> title(main="Allele frequency", col.main = "red", font.main=3) # main title
> title(xlab="Position", col.lab="black") # x-axis label
> title(ylab="Freq", col.lab="black") # y-axis label
> legend(1, max_y, names(input), cex=0.5, col=plot_colors, pc=21:23, lty=1:3)
> dev.off() #Off the PNG device


> for_hist <- c(input$x, input$y, input$z)
> hist(for_hist, col="blue", ylim=c(0,15000))
